# ALU Connect — Technical Overview

## 1. Project Overview

ALU Connect is a mobile application designed to serve as the digital heartbeat of the African Leadership University (ALU) campus community. The app unifies student life into a single platform where users can discover communities, browse and RSVP to events, chat with peers and groups, manage their profiles, and apply for membership in campus clubs and societies. Built entirely in Flutter, the application targets Android, iOS, web, Linux, macOS, and Windows from a single codebase.

The mission of ALU Connect is to bridge the gap between students, clubs, and campus events by providing an intuitive, engaging digital space that reflects the vibrant, pan-African spirit of ALU. By centralising discovery, communication, and membership management, the app aims to foster deeper student engagement and community belonging across ALU's distributed campus network.

### Context & Culture Fit

ALU Connect was designed specifically for the ALU community context. Its features draw directly from the real social structures that define ALU campus life: student-led clubs, hackathons, innovation labs, creative guilds, speaker series, and mentorship networks. The app's dark theme, bold pink accent palette, and informal yet polished tone reflect the energy and ambition of a generation of young African innovators. Rather than adopting a generic social-media model, ALU Connect mirrors the actual organisational patterns of the university, making it immediately intuitive for its target audience.

---

## 2. Unique Functionalities

- **Community Discovery & Membership Application**: Students explore clubs via browse, search, and filter chips (All Clubs, Academic, Arts & Culture, Innovation), view rich detail screens with leadership, perks, and tags, then apply for membership through a multi-step form tailored per community.
- **Persona-based Profile**: Users can switch their role mode (Student, Organizer, Mentor, Alumni), dynamically changing how their profile is presented — encouraging multi-role participation in campus life.
- **Event & Opportunity Hub**: The app displays upcoming events with category badges, stats (capacity, duration, fee), RSVP functionality, and a dedicated event creation flow with an Event/Opportunity toggle.
- **Group Chat with Rich Media Support**: The chat system supports text messages with read receipts, file attachments with download indicators, and image messages with placeholder rendering, all with online presence indicators.
- **Achievement Badges & Gamification**: Users earn badges (Early Adopter, Event Host, Top Contributor, Hackathon Winner, Mentor) that are displayed on their profiles, incentivising campus participation.
- **Trending & Spotlight Sections**: The home feed surfaces trending communities, a spotlight card for promoted content, campus announcements, and perk cards, keeping the most relevant information at the forefront.

---

## 3. UI/UX Design Rationale

The design system was rebuilt from scratch to serve ALU Connect's unique identity.

**Dark Theme Exclusivity**: A single dark theme was chosen over a light/dark toggle to create a distinctive, modern visual identity that stands out from generic apps. The deep navy background reduces eye strain during extended use — critical for students who spend hours on the app. The theme also evokes a "night sky" metaphor aligned with the pan-African innovation narrative.

**Custom Colour Palette**: The pink-primary paired with blue-secondary breaks away from conventional blue-only university apps. Pink conveys warmth, creativity, and approachability, while blue anchors the interface in professionalism. The three-tier text hierarchy (primary/secondary/tertiary) ensures readability without relying on font-size variation alone.

**Typography & Component Design**: The Inter typeface was selected for excellent on-screen readability and modern aesthetic. A classification-based naming system (display, heading, body, label, caption) maps directly to usage intent, making the design system scalable. Filter chips use animated containers with smooth transitions (180ms), providing tactile feedback. Chat bubbles employ asymmetric border radii to create visual directionality. Cards use layered surface containers (surface, surfaceContainer, surfaceContainerHigh) to establish depth hierarchy without relying on shadows.

---

## 4. Additional Functionalities Introduced

**Centralised Application State**: A new AluAppState class (ChangeNotifier) manages the user profile, saved opportunities, joined communities, and persona selection globally. An AppStateScope widget (InheritedNotifier) provides context-based access throughout the widget tree, eliminating prop-drilling and enabling reactive UI updates.

**Full Chat & Messaging System**: The ChatsScreen displays a searchable, filterable list of conversations with unread badges, online indicators, and message previews. The GroupChatScreen renders a complete messaging interface with date separators, three message types (text, file, image), read receipts, and a fully functional input bar with attachment, emoji, and send controls. Both screens were built from scratch.

**Refactored Navigation Architecture**: The bottom navigation was extracted from individual screens into a single AppShell widget driven by GoRouter's ShellRoute. This eliminated duplicated NavigationBar declarations across four screens and fixed the double-tab rendering bug. The shell now supports five tabs (Home, Explore, Add Event, Chats, Profile) with centralised index detection via URI path matching.

---

## 5. Navigation & State Handling

**Routing with GoRouter**: The application uses the go_router package (v14), a declarative routing framework. The routing tree consists of top-level routes (onboarding, event details, community detail, membership application) that present as full-screen modals using a root navigator key, and a ShellRoute that wraps the five bottom-tab destinations. This hybrid approach allows detail pages to cover the tab bar while tab pages preserve their shell context.

**State Management with ChangeNotifier + InheritedNotifier**: Rather than introducing a heavyweight state management library (BLoC, Riverpod, Redux), the project adopts Flutter's built-in ChangeNotifier pattern wrapped in an InheritedNotifier. This choice provides sufficient reactivity for a prototype while avoiding additional dependencies. The AluAppState class holds all global state (profile, persona, saved opportunities, joined communities) and exposes a setPersona method that triggers UI rebuilds via notifyListeners().

**Data Flow**: State flows downward from the MaterialApp root through AppStateScope. Any widget can retrieve the app state via AppStateScope.of(context), which automatically registers a dependency so the widget rebuilds when the notifier fires. For screen-level state (e.g., filter indices, form fields), StatefulWidget with setState() is used locally without polluting the global store.

---

## 6. Major Design & Product Decisions

- **Flat file structure over feature modules**: For a prototype with 12 screens, a flat lib/screens/ directory is simpler to navigate and refactor than a deep feature-tree. This can be reorganised as the codebase grows.
- **Hardcoded mock data over API integration**: All communities, events, messages, and profiles are hardcoded constants, enabling rapid UI iteration without backend dependency. A data layer abstraction can be introduced when a backend becomes available.
- **Multi-platform targeting**: The project targets all six Flutter platforms. While intended as a mobile app, this ensures the UI can be demonstrated on the web and desktop during development and review.
- **Material 3 with full customisation**: Rather than relying on Material default tokens, every colour, spacing, radius, and typography value is explicitly defined. This ensures visual consistency and makes the brand independent of framework defaults.
- **Rich community data model**: The CommunityData class (with 12 fields including leaders, perks, tags, specialisations) was designed to be rich enough to power both the detail screen and the membership application screen, reducing data duplication.

---

## 7. Challenges & Solutions

**Challenge 1: Duplicate Bottom Navigation Bars**  
Initially, every screen declared its own NavigationBar, causing double-rendering when used with GoRouter's ShellRoute. Fixing this required extracting the bottom nav into a single AppShell widget inside the ShellRoute builder. Each screen was stripped of its bottomNavigationBar, and the shell now determines the active tab index by matching the current URI path against a static route list.

**Challenge 2: Consistent Dark Theme Across All Components**  
Ensuring every component respected the custom dark palette was challenging because Material defaults intervene for unfilled text fields, dialog surfaces, and overlay colours. The solution was to explicitly define every colour scheme property (including surface, onSurface, outline, outlineVariant) and use AppColors constants in all custom widgets rather than Theme.of(context).colorScheme.

**Challenge 3: Multi-step Form Validation**  
The membership application form requires three steps (specialization selection, ambition text, portfolio URL), each with specific validation rules. The challenge was providing clear user feedback without overcomplicating the state. The solution uses local StatefulWidget state with SnackBar messages for validation errors, a simple approach that works well for a three-field form.

**Challenge 4: Rich Chat Message Types**  
Supporting text, file, and image messages with distinct rendering required a message type enum (_MsgType) and conditional widget building. The main challenge was ensuring the layout remained responsive across different message sizes. The solution uses MediaQuery-based max-width constraints (72% for sent, 68% for received messages) and separate widget methods for each message type.

---

## 8. Implementation Summary

| Layer | Technology | Role | Detail |
|---|---|---|---|
| Language | Dart | Logic + UI | SDK >=3.0.0 |
| Framework | Flutter | Cross-platform UI | Stable channel |
| State Management | ChangeNotifier | Global state | InheritedNotifier scope |
| Routing | GoRouter v14 | Declarative navigation | ShellRoute + top-level routes |
| Theme | Material 3 | Dark theme only | Custom ColourScheme |
| Typography | Inter | Readability | 5 semantic sizes |
| Data | Mock constants | No backend dependency | In-memory data |
| Platforms | 6 platforms | Android, iOS, Web | Linux, macOS, Windows |
