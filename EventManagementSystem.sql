-- Creating the Events table
CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(255),
    event_date DATE,
    event_location VARCHAR(255),
    event_description VARCHAR(255)
);

-- Creating the Organizers table
CREATE TABLE Organizers (
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(255),
    organizer_email VARCHAR(255),
    organizer_contact VARCHAR(255)
);

-- Creating the Attendees table
CREATE TABLE Attendees (
    attendee_id INT PRIMARY KEY,
    attendee_name VARCHAR(255),
    attendee_email VARCHAR(255),
    attendee_contact VARCHAR(255),
    event_id INT,
    FOREIGN KEY (event_id) REFERENCES Events (event_id)
);

-- Creating the Resources table
CREATE TABLE Resources (
    resource_id INT PRIMARY KEY,
    resource_name VARCHAR(255),
    resource_type VARCHAR(255),
    resource_capacity INT,
    resource_description VARCHAR(255)
);

-- Creating the Registrations table
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY,
    attendee_id INT,
    registration_date DATE,
    registration_status VARCHAR(255),
    FOREIGN KEY (attendee_id) REFERENCES Attendees (attendee_id)
);

-- Populating the Events table
INSERT INTO Events (event_id, event_name, event_date, event_location, event_description)
VALUES
    (1, 'Conference A', '2023-07-15', 'Venue A', 'A conference about technology'),
    (2, 'Seminar B', '2023-08-05', 'Venue B', 'A seminar on business strategies'),
    (3, 'Workshop C', '2023-09-20', 'Venue C', 'A workshop for creative writing'),
    (4, 'Training D', '2023-10-10', 'Venue D', 'A training session on leadership'),
    (5, 'Webinar E', '2023-11-01', 'Virtual', 'An online webinar on digital marketing'),
    (6, 'Exhibition F', '2023-11-15', 'Venue E', 'An exhibition of contemporary art'),
    (7, 'Panel Discussion G', '2023-12-05', 'Venue F', 'A panel discussion on climate change'),
    (8, 'Networking Event H', '2023-12-15', 'Venue G', 'A networking event for professionals'),
    (9, 'Workshop I', '2024-01-10', 'Venue H', 'A workshop on photography techniques'),
    (10, 'Conference J', '2024-02-01', 'Venue I', 'A conference on artificial intelligence');

-- Populating the Organizers table
INSERT INTO Organizers (organizer_id, organizer_name, organizer_email, organizer_contact)
VALUES
    (1, 'Organizer X', 'organizerx@example.com', '123-456-7890'),
    (2, 'Organizer Y', 'organizery@example.com', '987-654-3210'),
    (3, 'Organizer Z', 'organizerz@example.com', '555-555-5555'),
    (4, 'Organizer W', 'organizerw@example.com', '666-666-6666'),
    (5, 'Organizer P', 'organizerp@example.com', '777-777-7777'),
    (6, 'Organizer Q', 'organizerq@example.com', '888-888-8888'),
    (7, 'Organizer R', 'organizerr@example.com', '999-999-9999'),
    (8, 'Organizer S', 'organizers@example.com', '000-000-0000'),
    (9, 'Organizer T', 'organizert@example.com', '111-111-1111'),
    (10, 'Organizer U', 'organizeru@example.com', '222-222-2222');

-- Populating the Attendees table
INSERT INTO Attendees (attendee_id, attendee_name, attendee_email, attendee_contact, event_id)
VALUES
    (1, 'John Doe', 'johndoe@example.com', '111-111-1111', 1),
    (2, 'Jane Smith', 'janesmith@example.com', '222-222-2222', 1),
    (3, 'Mike Johnson', 'mikejohnson@example.com', '333-333-3333', 2),
    (4, 'Emily Brown', 'emilybrown@example.com', '444-444-4444', 3),
    (5, 'David Lee', 'davidlee@example.com', '555-555-5555', 4),
    (6, 'Sarah Davis', 'sarahdavis@example.com', '666-666-6666', 5),
    (7, 'Alex Wilson', 'alexwilson@example.com', '777-777-7777', 6),
    (8, 'Laura Thompson', 'laurathompson@example.com', '888-888-8888', 7),
    (9, 'Chris Evans', 'chrisevans@example.com', '999-999-9999', 8),
    (10, 'Olivia Turner', 'oliviaturner@example.com', '000-000-0000', 9);

-- Populating the Resources table
INSERT INTO Resources (resource_id, resource_name, resource_type, resource_capacity, resource_description)
VALUES
    (1, 'Venue A', 'Venue', 100, 'Large conference hall'),
    (2, 'Projector', 'Equipment', 1, 'High-definition projector'),
    (3, 'Catering Service', 'Catering', NULL, 'Provides food and beverages'),
    (4, 'Venue B', 'Venue', 50, 'Medium-sized event space'),
    (5, 'Microphone', 'Equipment', 5, 'Wireless microphones'),
    (6, 'Event Staff', 'Staffing', NULL, 'Provides event management and support'),
    (7, 'Venue C', 'Venue', 200, 'Outdoor venue with seating'),
    (8, 'Display Stands', 'Equipment', 10, 'Portable display stands'),
    (9, 'Lighting System', 'Equipment', 1, 'Stage lighting equipment'),
    (10, 'Venue D', 'Venue', 30, 'Small meeting room');

-- Populating the Registrations table
INSERT INTO Registrations (registration_id, attendee_id, registration_date, registration_status)
VALUES
    (1, 1, '2023-07-01', 'Confirmed'),
    (2, 2, '2023-07-02', 'Pending'),
    (3, 3, '2023-08-01', 'Confirmed'),
    (4, 4, '2023-09-01', 'Confirmed'),
    (5, 5, '2023-09-05', 'Pending'),
    (6, 6, '2023-10-01', 'Confirmed'),
    (7, 7, '2023-10-15', 'Confirmed'),
    (8, 8, '2023-11-01', 'Pending'),
    (9, 9, '2023-11-10', 'Confirmed'),
    (10, 10, '2023-12-01', 'Confirmed');
