module gitlab.com/gitlab-com/content-sites/handbook

go 1.25.4

// Use local path for Impact Orbit handbook module
replace github.com/impactorbitco/handbook-main => ../handbook-main

require (
	github.com/google/docsy v0.13.0 // indirect
	github.com/google/docsy/dependencies v0.7.2 // indirect
	github.com/impactorbitco/handbook-main v0.0.0-00010101000000-000000000000 // indirect
)
