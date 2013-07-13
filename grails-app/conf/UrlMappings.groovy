class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:'index')
		"/home"(view:"home")

		"500"(view:'/error')
	}
}
