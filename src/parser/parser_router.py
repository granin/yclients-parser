"""
Parser Router - Routes URLs to appropriate parser based on content type.
"""
import asyncio
import logging
from typing import List, Dict, Optional
from urllib.parse import urlparse

from src.parser.yclients_parser import YClientsParser
from src.database.db_manager import DatabaseManager

logger = logging.getLogger(__name__)


class ParserRouter:
    """Routes URLs to appropriate parser implementation."""
    
    def __init__(self, db_manager: DatabaseManager):
        self.db_manager = db_manager
        self.playwright_parser = None  # Lazy initialization
        
    async def parse_url(self, url: str) -> List[Dict]:
        """
        Route URL to appropriate parser.
        YClients → Playwright parser
        Others → Lightweight parser (fallback)
        """
        # Check if it's a YClients URL
        if self.is_yclients_url(url):
            logger.info(f"🎯 Routing to Playwright parser: {url}")
            return await self.parse_with_playwright(url)
        else:
            logger.info(f"📄 Routing to lightweight parser: {url}")
            # For non-YClients URLs, return empty list for now
            # Can be extended to handle other booking platforms
            logger.warning(f"Non-YClients URL detected: {url} - returning empty results")
            return []
    
    def is_yclients_url(self, url: str) -> bool:
        """Check if URL is YClients booking page."""
        yclients_indicators = [
            'yclients.com',
            'record-type',
            'personal/',
            'select-time',
            'select-master',
            'select-services',
            'personal/menu'
        ]
        return any(indicator in url for indicator in yclients_indicators)
    
    async def parse_with_playwright(self, url: str) -> List[Dict]:
        """Parse using Playwright browser automation."""
        # Initialize Playwright parser if needed
        if not self.playwright_parser:
            self.playwright_parser = YClientsParser([url], self.db_manager)
            await self.playwright_parser.initialize()
        
        try:
            # Use the new navigation flow
            success, data = await self.playwright_parser.parse_url(url)
            return data if success else []
        except Exception as e:
            logger.error(f"Playwright parsing failed for {url}: {e}")
            return []
        finally:
            # Clean up resources after each URL
            if self.playwright_parser:
                await self.playwright_parser.close()
                self.playwright_parser = None
    
    async def parse_multiple_urls(self, urls: List[str]) -> Dict[str, List[Dict]]:
        """Parse multiple URLs and return results."""
        results = {}
        
        for url in urls:
            logger.info(f"🔍 Processing URL: {url}")
            try:
                url_results = await self.parse_url(url)
                results[url] = url_results
                logger.info(f"✅ Extracted {len(url_results)} records from {url}")
            except Exception as e:
                logger.error(f"❌ Failed to parse {url}: {e}")
                results[url] = []
        
        return results
    
    async def close(self):
        """Clean up all resources."""
        if self.playwright_parser:
            await self.playwright_parser.close()
            self.playwright_parser = None