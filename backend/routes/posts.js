const express = require('express');
const router = express.Router();

// Mock data for the "false API"
const mockPosts = [
  { id: 1, title: 'First Blog Post', content: 'This is the first blog post.' },
  { id: 2, title: 'Second Blog Post', content: 'This is the second blog post.' },
  { id: 3, title: 'Third Blog Post', content: 'This is the third blog post.' },
];

// Get mock posts
router.get('/', (req, res) => {
  res.json(mockPosts);
});

module.exports = router;