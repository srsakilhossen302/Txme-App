import 'package:flutter/material.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';

import '../../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import '../../../../Widgegt/WorkerCard/WorkerCard.dart';
import '../models/provider_model.dart';

class Electricianproviders extends StatefulWidget {
  const Electricianproviders({super.key});

  @override
  State<Electricianproviders> createState() => _ElectricianprovidersState();
}

class _ElectricianprovidersState extends State<Electricianproviders> {
  final List<Map<String, dynamic>> providerList = [
    {
      "name": "John Electric",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.8,
      "orders": 150,
      "experience": 5,
      "skills": ["Wiring", "Repair", "Install", "Safety"],
      "available_from": "9:00 AM",
      "available_to": "5:00 PM",
      "rate": 35,
      "bio": "Dedicated electrician with top-notch service experience.",
      "reviews": [
        {
          "name": "David",
          "profile": "https://randomuser.me/api/portraits/men/32.jpg",
          "date": "12 Jan 2025",
          "rating": 4.5,
          "comment": "Very professional service!"
        },
        {
          "name": "Alice",
          "profile": "https://randomuser.me/api/portraits/women/21.jpg",
          "date": "5 Jan 2025",
          "rating": 4.5,
          "comment": "Great work!"
        },
        {
          "name": "Bob",
          "profile": "https://randomuser.me/api/portraits/men/33.jpg",
          "date": "12 Feb 2025",
          "rating": 4.7,
          "comment": "Highly professional!"
        }
      ]
    },
    {
      "name": "Michael Sparks",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/373548/pexels-photo-373548.jpeg",
      "rating": 4.6,
      "orders": 132,
      "experience": 4,
      "skills": ["Light Fix", "Fan Install", "Switch Repair"],
      "available_from": "10:00 AM",
      "available_to": "6:00 PM",
      "rate": 30,
      "bio":
          "Certified electrician specializing in domestic electric maintenance.",
      "reviews": [
        {
          "name": "Aron",
          "profile": "https://randomuser.me/api/portraits/men/28.jpg",
          "date": "18 Dec 2024",
          "rating": 4.7,
          "comment": "Quick and reliable!"
        },
        {
          "name": "Charlie",
          "profile": "https://randomuser.me/api/portraits/men/44.jpg",
          "date": "20 Mar 2025",
          "rating": 4.6,
          "comment": "Very reliable!"
        },
        {
          "name": "Diana",
          "profile": "https://randomuser.me/api/portraits/women/55.jpg",
          "date": "8 Apr 2025",
          "rating": 4.8,
          "comment": "Excellent service!"
        }
      ]
    },
    {
      "name": "Robert Fix",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.9,
      "orders": 200,
      "experience": 7,
      "skills": ["AC Repair", "Meter Setup", "Line Check"],
      "available_from": "8:00 AM",
      "available_to": "4:00 PM",
      "rate": 40,
      "bio":
          "Experienced in advanced electrical diagnostics and power line management.",
      "reviews": [
        {
          "name": "Sofia",
          "profile": "https://randomuser.me/api/portraits/women/50.jpg",
          "date": "10 Jan 2025",
          "rating": 5.0,
          "comment": "Outstanding work!"
        },
        {
          "name": "Alice",
          "profile": "https://randomuser.me/api/portraits/women/21.jpg",
          "date": "5 Jan 2025",
          "rating": 4.5,
          "comment": "Great work!"
        },
        {
          "name": "Bob",
          "profile": "https://randomuser.me/api/portraits/men/33.jpg",
          "date": "12 Feb 2025",
          "rating": 4.7,
          "comment": "Highly professional!"
        }
      ]
    },
    {
      "name": "Daniel Power",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.4,
      "orders": 98,
      "experience": 3,
      "skills": ["Switch Repair", "Light Setup"],
      "available_from": "11:00 AM",
      "available_to": "7:00 PM",
      "rate": 20,
      "bio": "Affordable electrician for light household electrical issues.",
      "reviews": [
        {
          "name": "Jessica",
          "profile": "https://randomuser.me/api/portraits/women/34.jpg",
          "date": "25 Dec 2024",
          "rating": 4.2,
          "comment": "Good behaviour and service."
        },
        {
          "name": "Charlie",
          "profile": "https://randomuser.me/api/portraits/men/44.jpg",
          "date": "20 Mar 2025",
          "rating": 4.6,
          "comment": "Very reliable!"
        },
        {
          "name": "Diana",
          "profile": "https://randomuser.me/api/portraits/women/55.jpg",
          "date": "8 Apr 2025",
          "rating": 4.8,
          "comment": "Excellent service!"
        }
      ]
    },
    {
      "name": "Mark Voltage",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.7,
      "orders": 120,
      "experience": 4,
      "skills": ["Cable Install", "Fuse Repair"],
      "available_from": "9:30 AM",
      "available_to": "5:30 PM",
      "rate": 32,
      "bio": "4 years experience in wiring and underground cable system.",
      "reviews": [
        {
          "name": "Adam",
          "profile": "https://randomuser.me/api/portraits/men/12.jpg",
          "date": "3 Jan 2025",
          "rating": 4.8,
          "comment": "Highly skilled!"
        },
        {
          "name": "Alice",
          "profile": "https://randomuser.me/api/portraits/women/21.jpg",
          "date": "5 Jan 2025",
          "rating": 4.5,
          "comment": "Great work!"
        },
        {
          "name": "Bob",
          "profile": "https://randomuser.me/api/portraits/men/33.jpg",
          "date": "12 Feb 2025",
          "rating": 4.7,
          "comment": "Highly professional!"
        }
      ]
    },
    {
      "name": "Leo Bright",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.5,
      "orders": 86,
      "experience": 2,
      "skills": ["Fan Install", "Light Fix", "Holder Change"],
      "available_from": "2:00 PM",
      "available_to": "10:00 PM",
      "rate": 18,
      "bio": "Fast & clean work. Specialized in indoor lighting.",
      "reviews": [
        {
          "name": "Sam",
          "profile": "https://randomuser.me/api/portraits/men/52.jpg",
          "date": "4 Jan 2025",
          "rating": 4.3,
          "comment": "Good and fast service."
        },
        {
          "name": "Diana",
          "profile": "https://randomuser.me/api/portraits/women/55.jpg",
          "date": "8 Apr 2025",
          "rating": 4.8,
          "comment": "Excellent service!"
        },
        {
          "name": "Charlie",
          "profile": "https://randomuser.me/api/portraits/men/44.jpg",
          "date": "20 Mar 2025",
          "rating": 4.6,
          "comment": "Very reliable!"
        }
      ]
    },
    {
      "name": "Kevin Light",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.3,
      "orders": 79,
      "experience": 3,
      "skills": ["Light Setup", "Switch Board"],
      "available_from": "9 AM",
      "available_to": "5 PM",
      "rate": 22,
      "bio": "Basic home electrical fixing expert.",
      "reviews": [
        {
          "name": "Alice",
          "profile": "https://randomuser.me/api/portraits/women/21.jpg",
          "date": "5 Jan 2025",
          "rating": 4.5,
          "comment": "Great work!"
        },
        {
          "name": "Bob",
          "profile": "https://randomuser.me/api/portraits/men/33.jpg",
          "date": "12 Feb 2025",
          "rating": 4.7,
          "comment": "Highly professional!"
        }
      ]
    },
    {
      "name": "Oliver Bolt",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.1,
      "orders": 60,
      "experience": 2,
      "skills": ["Fan Install", "Repair Work"],
      "available_from": "10 AM",
      "available_to": "6 PM",
      "rate": 20,
      "bio": "Friendly electrician, reliable service.",
      "reviews": [
        {
          "name": "Charlie",
          "profile": "https://randomuser.me/api/portraits/men/44.jpg",
          "date": "20 Mar 2025",
          "rating": 4.6,
          "comment": "Very reliable!"
        },
        {
          "name": "Diana",
          "profile": "https://randomuser.me/api/portraits/women/55.jpg",
          "date": "8 Apr 2025",
          "rating": 4.8,
          "comment": "Excellent service!"
        }
      ]
    },
    {
      "name": "Henry Sparks",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.9,
      "orders": 210,
      "experience": 6,
      "skills": ["Meter Install", "AC Wiring"],
      "available_from": "8 AM",
      "available_to": "4 PM",
      "rate": 50,
      "bio": "Expert in AC circuits and industrial wiring.",
      "reviews": [
        {
          "name": "Adam",
          "profile": "https://randomuser.me/api/portraits/men/12.jpg",
          "date": "3 Jan 2025",
          "rating": 4.8,
          "comment": "Highly skilled!"
        },
        {
          "name": "Sofia",
          "profile": "https://randomuser.me/api/portraits/women/50.jpg",
          "date": "10 Jan 2025",
          "rating": 5.0,
          "comment": "Outstanding work!"
        }
      ]
    },
    {
      "name": "Jason Circuit",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.6,
      "orders": 112,
      "experience": 4,
      "skills": ["Socket Fix", "Pump Wiring"],
      "available_from": "9 AM",
      "available_to": "6 PM",
      "rate": 28,
      "bio": "Pump wiring and socket repair specialist.",
      "reviews": [
        {
          "name": "Sam",
          "profile": "https://randomuser.me/api/portraits/men/52.jpg",
          "date": "4 Jan 2025",
          "rating": 4.3,
          "comment": "Good and fast service."
        },
        {
          "name": "Charlie",
          "profile": "https://randomuser.me/api/portraits/men/44.jpg",
          "date": "20 Mar 2025",
          "rating": 4.6,
          "comment": "Very reliable!"
        }
      ]
    },
    {
      "name": "Ethan Charge",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.4,
      "orders": 90,
      "experience": 3,
      "skills": ["Line Repair", "Breaker Box"],
      "available_from": "11 AM",
      "available_to": "7 PM",
      "rate": 25,
      "bio": "Focused on breaker and line maintenance.",
      "reviews": [
        {
          "name": "Diana",
          "profile": "https://randomuser.me/api/portraits/women/55.jpg",
          "date": "8 Apr 2025",
          "rating": 4.8,
          "comment": "Excellent service!"
        },
        {
          "name": "Bob",
          "profile": "https://randomuser.me/api/portraits/men/33.jpg",
          "date": "12 Feb 2025",
          "rating": 4.7,
          "comment": "Highly professional!"
        }
      ]
    },
    {
      "name": "Alex Wireman",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.7,
      "orders": 134,
      "experience": 5,
      "skills": ["Tube Light", "Holder Setup"],
      "available_from": "10 AM",
      "available_to": "5 PM",
      "rate": 33,
      "bio": "LED setup specialist.",
      "reviews": [
        {
          "name": "Alice",
          "profile": "https://randomuser.me/api/portraits/women/21.jpg",
          "date": "5 Jan 2025",
          "rating": 4.5,
          "comment": "Great work!"
        },
        {
          "name": "Sofia",
          "profile": "https://randomuser.me/api/portraits/women/50.jpg",
          "date": "10 Jan 2025",
          "rating": 5.0,
          "comment": "Outstanding work!"
        }
      ]
    },
    {
      "name": "Mason Electra",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.2,
      "orders": 70,
      "experience": 3,
      "skills": ["Switch Board", "Fan Setup"],
      "available_from": "12 PM",
      "available_to": "8 PM",
      "rate": 19,
      "bio": "2 years professional experience.",
      "reviews": [
        {
          "name": "Charlie",
          "profile": "https://randomuser.me/api/portraits/men/44.jpg",
          "date": "20 Mar 2025",
          "rating": 4.6,
          "comment": "Very reliable!"
        },
        {
          "name": "Sam",
          "profile": "https://randomuser.me/api/portraits/men/52.jpg",
          "date": "4 Jan 2025",
          "rating": 4.3,
          "comment": "Good and fast service."
        }
      ]
    },
    {
      "name": "Lucas Watt",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.8,
      "orders": 175,
      "experience": 6,
      "skills": ["Solar Panel", "Outdoor Wiring"],
      "available_from": "8 AM",
      "available_to": "2 PM",
      "rate": 55,
      "bio": "Solar panel installation expert.",
      "reviews": [
        {
          "name": "Adam",
          "profile": "https://randomuser.me/api/portraits/men/12.jpg",
          "date": "3 Jan 2025",
          "rating": 4.8,
          "comment": "Highly skilled!"
        },
        {
          "name": "Diana",
          "profile": "https://randomuser.me/api/portraits/women/55.jpg",
          "date": "8 Apr 2025",
          "rating": 4.8,
          "comment": "Excellent service!"
        }
      ]
    },
    {
      "name": "Noah LightFix",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.5,
      "orders": 120,
      "experience": 4,
      "skills": ["Switch Fix", "Light Holder"],
      "available_from": "9 AM",
      "available_to": "5 PM",
      "rate": 25,
      "bio": "Experienced in general home wiring.",
      "reviews": [
        {
          "name": "Charlie",
          "profile": "https://randomuser.me/api/portraits/men/44.jpg",
          "date": "20 Mar 2025",
          "rating": 4.6,
          "comment": "Very reliable!"
        },
        {
          "name": "Sofia",
          "profile": "https://randomuser.me/api/portraits/women/50.jpg",
          "date": "10 Jan 2025",
          "rating": 5.0,
          "comment": "Outstanding work!"
        }
      ]
    },
    {
      "name": "Aiden Fuse",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.3,
      "orders": 85,
      "experience": 3,
      "skills": ["Fuse Fix", "Starter Repair"],
      "available_from": "1 PM",
      "available_to": "9 PM",
      "rate": 21,
      "bio": "Fuse repairing expert.",
      "reviews": [
        {
          "name": "Alice",
          "profile": "https://randomuser.me/api/portraits/women/21.jpg",
          "date": "5 Jan 2025",
          "rating": 4.5,
          "comment": "Great work!"
        },
        {
          "name": "Bob",
          "profile": "https://randomuser.me/api/portraits/men/33.jpg",
          "date": "12 Feb 2025",
          "rating": 4.7,
          "comment": "Highly professional!"
        }
      ]
    },
    {
      "name": "James Power",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.6,
      "orders": 100,
      "experience": 4,
      "skills": ["Fan Repair", "Tube Light"],
      "available_from": "10 AM",
      "available_to": "6 PM",
      "rate": 27,
      "bio": "Best for indoor electrical tasks.",
      "reviews": [
        {
          "name": "Diana",
          "profile": "https://randomuser.me/api/portraits/women/55.jpg",
          "date": "8 Apr 2025",
          "rating": 4.8,
          "comment": "Excellent service!"
        },
        {
          "name": "Sam",
          "profile": "https://randomuser.me/api/portraits/men/52.jpg",
          "date": "4 Jan 2025",
          "rating": 4.3,
          "comment": "Good and fast service."
        }
      ]
    },
    {
      "name": "William Circuit",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.7,
      "orders": 115,
      "experience": 4,
      "skills": ["Smart Light", "Sensor Setup"],
      "available_from": "8 AM",
      "available_to": "3 PM",
      "rate": 29,
      "bio": "Smart home electrician.",
      "reviews": [
        {
          "name": "Alice",
          "profile": "https://randomuser.me/api/portraits/women/21.jpg",
          "date": "5 Jan 2025",
          "rating": 4.5,
          "comment": "Great work!"
        },
        {
          "name": "Charlie",
          "profile": "https://randomuser.me/api/portraits/men/44.jpg",
          "date": "20 Mar 2025",
          "rating": 4.6,
          "comment": "Very reliable!"
        },
        {
          "name": "Bob",
          "profile": "https://randomuser.me/api/portraits/men/33.jpg",
          "date": "12 Feb 2025",
          "rating": 4.7,
          "comment": "Highly professional!"
        }
      ]
    },
    {
      "name": "Benjamin Shock",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.4,
      "orders": 79,
      "experience": 2,
      "skills": ["Switch Board", "Fan"],
      "available_from": "3 PM",
      "available_to": "10 PM",
      "rate": 18,
      "bio": "Beginner level but very hardworking.",
      "reviews": [
        {
          "name": "Diana",
          "profile": "https://randomuser.me/api/portraits/women/55.jpg",
          "date": "8 Apr 2025",
          "rating": 4.8,
          "comment": "Excellent service!"
        },
        {
          "name": "Alice",
          "profile": "https://randomuser.me/api/portraits/women/21.jpg",
          "date": "5 Jan 2025",
          "rating": 4.5,
          "comment": "Great work!"
        }
      ]
    },
    {
      "name": "Jacob ElectricHub",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.9,
      "orders": 220,
      "experience": 7,
      "skills": ["High Voltage", "Control System"],
      "available_from": "9 AM",
      "available_to": "3 PM",
      "rate": 60,
      "bio": "High voltage expert technician.",
      "reviews": [
        {
          "name": "Bob",
          "profile": "https://randomuser.me/api/portraits/men/33.jpg",
          "date": "12 Feb 2025",
          "rating": 4.7,
          "comment": "Highly professional!"
        },
        {
          "name": "Sofia",
          "profile": "https://randomuser.me/api/portraits/women/50.jpg",
          "date": "10 Jan 2025",
          "rating": 5.0,
          "comment": "Outstanding work!"
        }
      ]
    },
    {
      "name": "Eli Volt",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.5,
      "orders": 88,
      "experience": 3,
      "skills": ["AC Wiring", "Fan Install"],
      "available_from": "11 AM",
      "available_to": "7 PM",
      "rate": 24,
      "bio": "Specialized in AC circuits and indoor wiring.",
      "reviews": [
        {
          "name": "Charlie",
          "profile": "https://randomuser.me/api/portraits/men/44.jpg",
          "date": "20 Mar 2025",
          "rating": 4.6,
          "comment": "Very reliable!"
        },
        {
          "name": "Sam",
          "profile": "https://randomuser.me/api/portraits/men/52.jpg",
          "date": "4 Jan 2025",
          "rating": 4.3,
          "comment": "Good and fast service."
        }
      ]
    },
    {
      "name": "Oliver Spark",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.6,
      "orders": 92,
      "experience": 4,
      "skills": ["Socket Fix", "Light Setup"],
      "available_from": "10 AM",
      "available_to": "6 PM",
      "rate": 26,
      "bio": "Reliable electrician for indoor electrical works.",
      "reviews": [
        {
          "name": "Alice",
          "profile": "https://randomuser.me/api/portraits/women/21.jpg",
          "date": "5 Jan 2025",
          "rating": 4.5,
          "comment": "Great work!"
        },
        {
          "name": "Diana",
          "profile": "https://randomuser.me/api/portraits/women/55.jpg",
          "date": "8 Apr 2025",
          "rating": 4.8,
          "comment": "Excellent service!"
        }
      ]
    },
    {
      "name": "Henry Volt",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.7,
      "orders": 115,
      "experience": 5,
      "skills": ["Fuse Install", "Breaker Box"],
      "available_from": "8 AM",
      "available_to": "4 PM",
      "rate": 28,
      "bio": "Expert in wiring and breaker maintenance.",
      "reviews": [
        {
          "name": "Sofia",
          "profile": "https://randomuser.me/api/portraits/women/50.jpg",
          "date": "10 Jan 2025",
          "rating": 5.0,
          "comment": "Outstanding work!"
        },
        {
          "name": "Bob",
          "profile": "https://randomuser.me/api/portraits/men/33.jpg",
          "date": "12 Feb 2025",
          "rating": 4.7,
          "comment": "Highly professional!"
        }
      ]
    },
    {
      "name": "Lucas Spark",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.8,
      "orders": 130,
      "experience": 6,
      "skills": ["Solar Panel", "Line Check"],
      "available_from": "9 AM",
      "available_to": "5 PM",
      "rate": 50,
      "bio": "Expert in solar panel and line maintenance.",
      "reviews": [
        {
          "name": "Charlie",
          "profile": "https://randomuser.me/api/portraits/men/44.jpg",
          "date": "20 Mar 2025",
          "rating": 4.6,
          "comment": "Very reliable!"
        },
        {
          "name": "Sam",
          "profile": "https://randomuser.me/api/portraits/men/52.jpg",
          "date": "4 Jan 2025",
          "rating": 4.3,
          "comment": "Good and fast service."
        }
      ]
    },
    {
      "name": "Ethan Wire",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.4,
      "orders": 95,
      "experience": 3,
      "skills": ["Tube Light", "Holder Setup"],
      "available_from": "10 AM",
      "available_to": "6 PM",
      "rate": 22,
      "bio": "LED setup and holder expert.",
      "reviews": [
        {
          "name": "Alice",
          "profile": "https://randomuser.me/api/portraits/women/21.jpg",
          "date": "5 Jan 2025",
          "rating": 4.5,
          "comment": "Great work!"
        },
        {
          "name": "Diana",
          "profile": "https://randomuser.me/api/portraits/women/55.jpg",
          "date": "8 Apr 2025",
          "rating": 4.8,
          "comment": "Excellent service!"
        }
      ]
    },
    {
      "name": "Mason Light",
      "service": "Electrician",
      "image":
          "https://images.pexels.com/photos/462234/pexels-photo-462234.jpeg",
      "rating": 4.5,
      "orders": 110,
      "experience": 4,
      "skills": ["Switch Board", "Fan Setup"],
      "available_from": "11 AM",
      "available_to": "7 PM",
      "rate": 24,
      "bio": "Professional experience in indoor wiring.",
      "reviews": [
        {
          "name": "Bob",
          "profile": "https://randomuser.me/api/portraits/men/33.jpg",
          "date": "12 Feb 2025",
          "rating": 4.7,
          "comment": "Highly professional!"
        },
        {
          "name": "Sofia",
          "profile": "https://randomuser.me/api/portraits/women/50.jpg",
          "date": "10 Jan 2025",
          "rating": 5.0,
          "comment": "Outstanding work!"
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: providerList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.70,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return WorkerCard(
              provider: ProviderModel.fromJson(providerList[index]),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 0),
    );
  }
}
