### iOS Foundation
1. **Explain the iOS app lifecycle.**
The iOS app lifecycle defines the sequence of states an app goes through from launch until termination. Understanding these states is essential because it helps developers manage resources and handle transitions appropriately, leading to a smoother user experience. Here’s an overview of each key state:

### 1. **Not Running**
   - The app is in this state before it’s launched or after it has been terminated. 
   - There is no code being executed, and the app’s resources are completely freed.

### 2. **Inactive**
   - The app enters the inactive state briefly when it is transitioning between states, such as moving to the foreground or background.
   - For example, when a call is received, the app might go inactive temporarily.
   - In this state, the app is still visible but not actively receiving user input or events.
   - **Method**: `applicationWillResignActive(_:)` is called.

### 3. **Active**
   - The app is fully in the foreground, receiving events, and interacting with the user.
   - This is typically the primary state where most of the app’s functionality occurs.
   - **Method**: `applicationDidBecomeActive(_:)` is called when the app transitions to this state.

### 4. **Background**
   - The app moves to the background when the user presses the home button, switches to another app, or closes the app.
   - In this state, the app is no longer visible to the user but can continue to execute code for a short time.
   - **Tasks**: Apps have approximately 5 seconds to complete tasks before being suspended, although apps with specific needs (like navigation or music) can request additional background time.
   - **Method**: `applicationDidEnterBackground(_:)` is called when the app moves to the background.

### 5. **Suspended**
   - After background execution completes, the app enters the suspended state where it remains in memory but doesn’t execute any code.
   - The app is frozen, meaning it retains its state, but no code runs until it’s reopened or brought to the foreground.
   - If the system needs more memory, suspended apps may be terminated without additional notifications to the app.

---

### Key Lifecycle Methods in `AppDelegate`

1. **application(_:didFinishLaunchingWithOptions:)**
   - Called when the app has finished launching. Use this method to initialize settings, resources, or services.
   
2. **applicationWillEnterForeground(_:)**
   - Called when the app is moving from the background to the active state.
   
3. **applicationDidBecomeActive(_:)**
   - Called when the app has moved to the active state and can begin processing events.
   
4. **applicationWillResignActive(_:)**
   - Called when the app is about to move from active to inactive, such as during an interruption.
   
5. **applicationDidEnterBackground(_:)**
   - Called when the app has moved to the background. Use it to save data, release shared resources, and store enough state information to restore the app.
   
6. **applicationWillTerminate(_:)**
   - Called when the app is about to be terminated. Save any critical data and clean up resources in this method.

### Summary Diagram of iOS App Lifecycle

```plaintext
             +-------------+
      Launch | Not Running |
             +-------------+
                   |
                   V
        +--------Inactive---------+
        |                         |
       Foreground                Background
      Transition                  Transition
        |                           |
        V                           V
   +--------+   User Interaction +--------+
   | Active |<------------------>|Background|
   +--------+                     +--------+
       |                               |
       V                               V
   Inactive--------------------------Suspended
```

Each of these states and transitions helps manage resources effectively and gives developers control over what happens during state changes, leading to smoother app performance.

2. **What is the difference between `viewDidLoad`, `viewWillAppear`, and `viewDidAppear` in view controllers?**
### Summary of Differences
| Method           | Called When                                    | Purpose                                      | Frequency               |
|------------------|------------------------------------------------|----------------------------------------------|-------------------------|
| **viewDidLoad**  | Once, after the view is loaded into memory     | Initial setup and one-time configurations    | Only once per lifecycle |
| **viewWillAppear** | Every time before the view appears on screen  | Refreshing/updating data or UI elements      | Every appearance        |
| **viewDidAppear**  | Right after the view has appeared on screen   | Start animations, track analytics, etc.      | Every appearance        |

4. **How does `UIViewController` differ from `UIView`?**

Certainly, here’s a concise comparison:

| Feature                    | `UIViewController`                                     | `UIView`                                |
|----------------------------|--------------------------------------------------------|-----------------------------------------|
| **Role**                   | Manages a screen and its views                         | Displays content and handles user input |
| **MVC Position**           | Controller                                             | View                                    |
| **Lifecycle**              | Full lifecycle (`viewDidLoad`, `viewWillAppear`, etc.) | Limited lifecycle (`init`, `draw`, etc.)|
| **Memory Management**      | Manages memory with `didReceiveMemoryWarning`          | Managed by parent views                 |
| **Event Handling**         | Handles high-level app events                          | Handles touch and gesture events        |
| **Use Case**               | For screens/pages                                      | For UI components or subviews           |

In short, `UIViewController` handles the logic and flow of a screen, while `UIView` manages rendering and interaction for individual components.


# Architecture 
What the difference between MVVM and Clean Architecture ? 
| Aspect                     | Clean Architecture                               | MVVM                                       |
|----------------------------|-------------------------------------------------|--------------------------------------------|
| **Purpose**                | Provides a layered approach for organizing code to enhance maintainability, scalability, and testability. | Separates UI logic from business logic to improve the organization of UI-related code. |
| **Components**             | Entities, Use Cases, Interface Adapters, Frameworks & Drivers | Model, View, ViewModel                     |
| **Layers**                 | Multi-layered structure, with each layer having a specific role (e.g., core, application, infrastructure). | Primarily focuses on three components: Model, View, and ViewModel. |
| **Dependency Management**  | Implements the Dependency Rule, where inner layers don’t depend on outer layers. | ViewModel can depend on Model, and View can observe changes in ViewModel. |
| **Flexibility**            | Highly flexible; allows changes in any outer layer without affecting core logic. | Mostly flexible for UI changes but less so for core business logic. |
| **Testability**            | High testability for all layers, facilitating unit testing across the application. | Easier testing of the ViewModel, as it decouples UI logic from the View. |
| **Usage Context**          | Applicable for a wide range of applications, including web, mobile, and enterprise systems. | Commonly used in UI-centric applications, particularly in mobile and desktop frameworks. |
| **Data Binding**           | No built-in data binding; data flow is handled explicitly through method calls. | Supports data binding, allowing automatic updates of the View based on changes in the ViewModel. |
| **Complexity**             | Can be more complex to implement due to multiple layers and strict rules. | Generally less complex, focusing mainly on UI interactions. |
