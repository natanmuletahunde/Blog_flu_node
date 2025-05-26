📝 Blog App

A full-stack modern blog application built with Flutter and Node.js, allowing users to sign up, sign in, create and explore blog posts with image uploads. Designed with an elegant UI, it works across web, Android, and iOS.
🚀 Features

    ✅ User Authentication – Secure sign-up & sign-in using email and password with JWT auth.

    🖼️ Post Creation – Add posts with a title, description, and image upload (supports web/mobile).

    🔍 Post Search – Real-time filtering by name or description.

    🎨 Modern UI – Gradient backgrounds, animations, card layouts, and smooth transitions.

    📱 Responsive Design – Seamless UI for Web, Android, and iOS.

    📄 About & Contact Pages – Includes a working contact form and social media buttons.

    🗑️ Post Deletion – Swipe to delete posts (mock implementation).

    🔒 Social Login Placeholder – Buttons for Google and Facebook (UI only for now).

📸 Screenshots

(Add screenshots like: SignInPage, HomePage with posts, ContactPage with form)
You can upload them to your GitHub repo and embed like:

![HomePage](https://github.com/your-username/blog-app/blob/main/screenshots/home.png)

🏗️ Project Structure

blog-app/
├── backend/           # Node.js backend
│   ├── models/        # MongoDB models (User.js, Post.js)
│   ├── routes/        # API routes (auth.js, posts.js, upload.js)
│   ├── uploads/       # Folder for uploaded images
│   ├── server.js      # Main server file
│   └── package.json
├── frontend/          # Flutter frontend
│   ├── lib/
│   │   ├── models/    # Data models (post.dart)
│   │   ├── pages/     # UI Pages (home_page.dart, sign_in_page.dart, etc.)
│   │   ├── services/  # API services (api_service.dart, auth_service.dart)
│   │   └── widgets/   # Reusable widgets (post_card.dart, etc.)
│   └── pubspec.yaml
└── README.md

⚙️ Setup Instructions
🔧 Backend (Node.js)

    Navigate to the backend directory:

cd blog-app/backend

Install dependencies:

npm install

Set up environment variables:
Create a .env file in the backend folder with:

MONGODB_URI=mongodb://localhost:27017/blogapp
JWT_SECRET=your_jwt_secret
PORT=5000

Start the server:

    npm start

    The backend API will be available at: http://localhost:5000

💻 Frontend (Flutter)

    Navigate to the Flutter app:

cd blog-app/frontend

Install Flutter packages:

flutter pub get

Run the app:

    For web:

flutter run -d chrome

For mobile (emulator/device):

        flutter run

⚠️ Make sure the backend server is running before launching the app.
🔌 API Endpoints
🔐 Authentication

    POST /api/auth/signup – Create a new user.

    POST /api/auth/signin – Login an existing user.

📝 Posts

    GET /api/posts – Fetch all posts.

📤 Upload

    POST /api/upload – Upload a post with name, description, and image.

🛠️ Technologies Used
Frontend – Flutter

    http – API calls

    image_picker – Select/upload images

    permission_handler – Runtime permissions

    shared_preferences – Store JWT

    jwt_decoder – Decode JWT tokens

    url_launcher – Open external links

Backend – Node.js

    express – Web framework

    mongoose – MongoDB ODM

    jsonwebtoken – JWT auth

    bcryptjs – Password hashing

    multer – File uploads

    dotenv – Env variables

    cors – CORS middleware

📬 Contact

For questions or feedback:

    📧 Email: natanmuleta77@example.com

    💻 GitHub: Your GitHub Username

📄 License

This project is licensed under the MIT License. See the LICENSE file for details.
💡 Contributing

Contributions are welcome!

    Fork the repo

    Create a branch: git checkout -b feature/your-feature

    Commit: git commit -m 'Add feature'

    Push: git push origin feature/your-feature

    Open a Pull Request
