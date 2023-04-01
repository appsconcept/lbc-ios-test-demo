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
- Unit tests
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
  


  ### Copyright:

  Leboncoin logo obtained from a Creative Commons domain: https://www.google.com/url?sa=i&url=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3ALeboncoin_Logo_%25282016%2529.svg&psig=AOvVaw2-k9FNHFu1cavvhHd2ULFw&ust=1680433409820000&source=images&cd=vfe&ved=0CBEQjhxqFwoTCMiO5LXEiP4CFQAAAAAdAAAAABAD