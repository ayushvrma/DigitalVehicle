# DigitalVehicle
# RTO Digitalization System - Flutter App

## Description
This Flutter application digitalizes the RTO (Regional Transport Office) system in India, enabling both users and police personnel to access registered vehicle information and manage fines (chalaan). Users can register their vehicles, providing essential details like the Registration Certificate (RC). Police personnel can issue fines and search for vehicle information using this application.

## Features
- User Registration: Users can register vehicles by entering their RC details, making them accessible in the system.
- Vehicle Information: Registered users and police can search for and retrieve information about registered vehicles.
- Chalaan Management: Police can issue fines (chalaan) to vehicles that violate traffic regulations.
- User Authentication: Secure login and authentication for both users and police personnel.
- Backend Integration: Utilizes a Flask backend to manage database interactions and serve API requests.
- Database: PostgreSQL is used as the database to store vehicle and user information.

## Prerequisites
- Flutter: Make sure you have Flutter installed. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).
- Flask: Install Flask for the backend. You can set up a virtual environment and install the required packages using `pip install -r requirements.txt`.
- PostgreSQL: Set up a PostgreSQL database and configure the connection details in the Flask backend.

## Getting Started
1. Clone this repository: `git clone https://github.com/your-username/rto-flutter-app.git`
2. Navigate to the project directory: `cd rto-flutter-app`
3. Install Flutter dependencies: `flutter pub get`
4. Run the Flutter app: `flutter run`

## Backend Setup
1. Navigate to the `backend` directory: `cd backend`
2. Set up a virtual environment: `python3 -m venv venv`
3. Activate the virtual environment: `source venv/bin/activate`
4. Install required packages: `pip install -r requirements.txt`
5. Configure PostgreSQL connection in `app/config.py`
6. Run the Flask app: `flask run`

## Contributing
Contributions are welcome! If you encounter any bugs or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License
This project is licensed under the [MIT License](LICENSE).

---

