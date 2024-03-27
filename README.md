#Library Management
Project file Structure:
^^^^^^^^^^^^^^^^^^^^^^^

src
├── main
│   ├── java
│   │   └── com
│   │       └── example
│   │           ├── config
│   │           │   └── SecurityConfig.java
│   │           ├── controller
│   │           │   ├── AdminController.java
│   │           │   ├── UserController.java
│   │           │   └── LoginController.java
│   │           ├── model
│   │           │   └── User.java
│   │           ├── repository
│   │           │   └── UserRepository.java
│   │           ├── service
│   │           │   ├── UserService.java
│   │           │   └── UserDetailsService.java
│   │           └── DemoApplication.java
│   └── resources
│       └── templates
│           ├── login.html
│           ├── admin-dashboard.html
│           └── user-dashboard.html
