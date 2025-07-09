# 📖 Random Quote Generator - Flutter App

A simple Flutter app that fetches a random quote from the internet and displays it beautifully.  
This app demonstrates how to make HTTP requests, parse JSON, and update the UI in real time.

---

## 🌐 API Used

We used the [DummyJSON Quotes API](https://dummyjson.com/docs/quotes) — specifically:
https://dummyjson.com/quotes/random
Let me know if you'd like:
- Help creating or uploading the screenshot
- A video preview for README
- To deploy this as a Flutter Web version for sharing online

- ⚙️ JSON Parsing Logic
We decode the response using json.decode() from Dart's dart:convert library:
final data = json.decode(response.body);
_quote = data['quote'];
_author = data['author'];

🚀 How to Run
bash
Copy
Edit
git clone https://github.com/your-username/quote-app-dummyjson.git
cd quote-app-dummyjson
flutter pub get
flutter run

ScreenShot :
<img width="1915" height="977" alt="Image" src="https://github.com/user-attachments/assets/037572d1-8d51-462b-8976-8882f34e4f2c" />
<img width="1907" height="969" alt="Image" src="https://github.com/user-attachments/assets/54807738-737a-4d39-8bbb-76a78daa7886" />

This returns a single random quote like:

```json
{
  "id": 5,
  "quote": "All you need in this life is ignorance and confidence, and then success is sure.",
  "author": "Mark Twain"
}




---

