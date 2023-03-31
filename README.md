# lbc-ios-test-demo
## Demo application with a simple and clean UI to present a list of classified ads and their details.

### Architecture:

Based on the Clean Architecture.
The structure is (from inner layers to outer layers):
- Logic
  - Entities (DTOs and Models)
  - Services
  - Repositories
  - UseCases
- UI
  - ViewModels
  - ViewControllers

### Functionalities:

- API requests to acquire list of ads and list of categories
- Manual dependency injection using a Container of singletons and initializers
- Image caching
- List of classified ads
  - Thumbnail
  - Title
  - Price
  - Category
  - Urgent badge
- Details page
  - Gallery (single image)
  - Urgent badge
  - Title
  - Price
  - Date
  - Details section
    - Category
  - Description section
  