---
change: CHG-0002-document-the-existing-swift-units-api-at-complete-specsync-coverage
artifact: design
---

# Design

Use one stable `units` companion because all concrete dimensions share the generic Unit and Measurement contract.
Group public symbols by conversion core, dimension, numeric constructors, and physical constants while retaining every
parsed export name. Assign one requirement to the core protocol, one to Measurement, and one to each behavioral family.
