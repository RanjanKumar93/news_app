# News App

A Flutter news application that fetches and displays news articles.

## Getting Started

### Prerequisites

- Flutter SDK (version 3.5.3 or higher)
- Dart SDK
- A News API key from [newsapi.org](https://newsapi.org/)

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd news_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   - Copy the example environment file:
     ```bash
     cp .env.example .env
     ```
   - Edit the `.env` file and add your News API key:
     ```env
     NEWS_API_KEY=your_actual_api_key_here
     ```

4. **Generate code (if needed)**
   ```bash
   flutter packages pub run build_runner build
   ```

5. **Run the application**
   ```bash
   flutter run
   ```

### Getting a News API Key

1. Visit [newsapi.org](https://newsapi.org/)
2. Sign up for a free account
3. Get your API key from the dashboard
4. Add it to your `.env` file

## Features

- Browse top headlines
- Search for news articles
- Cached images for better performance
- State management with Riverpod

## Dependencies

- `dio` - HTTP client for API calls
- `flutter_riverpod` - State management
- `freezed` - Code generation for immutable classes
- `cached_network_image` - Image caching
- `flutter_dotenv` - Environment variable management

## Project Structure
