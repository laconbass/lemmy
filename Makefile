include .lemmy/setup
include .lemmy/directories
include .lemmy/executables
include .lemmy/variables
include .lemmy/templates
include .lemmy/javascript
include .lemmy/coffeescript
include .lemmy/ejs
include .lemmy/jade
include .lemmy/test
include .lemmy/licenses

help:
	@echo $(HELPMENU)

version:
	@echo "0.5.2"

ifeq "$(APP_LANGUAGE)" "CS"
clean:
	@rm -f *.log
	@rm -f $(APP_FILE)
	@rm -rf $(APPS_DIRECTORY)
	@rm -rf $(MODULES_DIRECTORY)
	@rm -rf $(HELPERS_DIRECTORY)
	@rm -rf $(MIDDLEWARES_DIRECTORY)
	@rm -rf $(ROUTES_DIRECTORY)
	@rm -rf $(CONTROLLERS_DIRECTORY)
	@rm -rf $(MODELS_DIRECTORY)
	@rm -rf $(DEPLOYMENT_DIRECTORY)
else
clean:
	@rm -f *.log
	@rm -rf $(DEPLOYMENT_DIRECTORY)
endif

update:
	@git clone https://github.com/rock-n-code/lemmy $(TEMPORARY_DIRECTORY)
	@mv .lemmy/setup $(TEMPORARY_DIRECTORY)
	@rm -rf .lemmy
	@rm Makefile
	@mv $(TEMPORARY_DIRECTORY)/.lemmy .
	@rm .lemmy/setup
	@mv $(TEMPORARY_DIRECTORY)/setup .lemmy
	@mv $(TEMPORARY_DIRECTORY)/Makefile .
	@rm -rf $(TEMPORARY_DIRECTORY)

ifeq "$(APP_ENVIRONMENT)" "production"
dependencies:
	@if [ -d "$(DEPENDENCIES_DIRECTORY)" ]; then rm -rf $(DEPENDENCIES_DIRECTORY); fi
	@npm install --production
else
dependencies:
	@if [ -d "$(DEPENDENCIES_DIRECTORY)" ]; then rm -rf $(DEPENDENCIES_DIRECTORY); fi
	@npm install
endif

mit-license:
	@echo $(MIT_LICENSE) > LICENSE

ifeq "$(LANGUAGE)" "cs"
ifeq "$(TYPE)" "standard"
ifeq "$(ENGINE)" "ejs"
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@echo "APP_ENGINE = EJS" >> .lemmy/setup
	@make setup-coffeescript-project
	@make git-init
else 
ifeq "$(ENGINE)" "jade"
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@echo "APP_ENGINE = JADE" >> .lemmy/setup
	@make setup-coffeescript-project
	@make git-init
else
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@make setup-coffeescript-project
	@make git-init
endif
endif
else 
ifeq "$(TYPE)" "modular"
ifeq "$(ENGINE)" "ejs"
setup:
	@echo "APP_TYPE = MODULAR" >> .lemmy/setup
	@echo "APP_ENGINE = EJS" >> .lemmy/setup
	@make setup-coffeescript-project
	@make git-init
else 
ifeq "$(ENGINE)" "jade"
setup:
	@echo "APP_TYPE = MODULAR" >> .lemmy/setup
	@echo "APP_ENGINE = JADE" >> .lemmy/setup
	@make setup-coffeescript-project
	@make git-init
else
setup:
	@echo "APP_TYPE = MODULAR" >> .lemmy/setup
	@make setup-coffeescript-project
	@make git-init
endif
endif
else
ifeq "$(TYPE)" ""
ifeq "$(ENGINE)" "ejs"
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@echo "APP_ENGINE = EJS" >> .lemmy/setup
	@make setup-coffeescript-project
	@make git-init
else 
ifeq "$(ENGINE)" "jade"
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@echo "APP_ENGINE = JADE" >> .lemmy/setup
	@make setup-coffeescript-project
	@make git-init
else
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@make setup-coffeescript-project
	@make git-init
endif
endif
else
setup:
	@echo "ERROR: The TYPE you entered is unknown. Please choose between 'standard' or 'modular' types."
endif
endif
endif
else
ifeq "$(TYPE)" "standard"
ifeq "$(ENGINE)" "ejs"
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@echo "APP_ENGINE = EJS" >> .lemmy/setup
	@make setup-javascript-project
	@make git-init
else
ifeq "$(ENGINE)" "jade"
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@echo "APP_ENGINE = JADE" >> .lemmy/setup
	@make setup-javascript-project
	@make git-init
else
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@make setup-javascript-project
	@make git-init
endif
endif
else 
ifeq "$(TYPE)" "modular"
ifeq "$(ENGINE)" "ejs"
setup:
	@echo "APP_TYPE = MODULAR" >> .lemmy/setup
	@echo "APP_ENGINE = EJS" >> .lemmy/setup
	@make setup-javascript-project
	@make git-init
else
ifeq "$(ENGINE)" "jade"
setup:
	@echo "APP_TYPE = MODULAR" >> .lemmy/setup
	@echo "APP_ENGINE = JADE" >> .lemmy/setup
	@make setup-javascript-project
	@make git-init
else
setup:
	@echo "APP_TYPE = MODULAR" >> .lemmy/setup
	@make setup-javascript-project
	@make git-init
endif
endif
else 
ifeq "$(TYPE)" ""
ifeq "$(ENGINE)" "ejs"
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@echo "APP_ENGINE = EJS" >> .lemmy/setup
	@make setup-javascript-project
	@make git-init
else
ifeq "$(ENGINE)" "jade"
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@echo "APP_ENGINE = JADE" >> .lemmy/setup
	@make setup-javascript-project
	@make git-init
else
setup:
	@echo "APP_TYPE = STANDARD" >> .lemmy/setup
	@make setup-javascript-project
	@make git-init
endif
endif
else
setup:
	@echo "ERROR: The TYPE you entered is unknown. Please choose between 'standard' or 'modular' types."
endif
endif
endif
endif

ifeq "$(APP)" ""
ifeq "$(TYPE)" ""
ifeq "$(APP_ENGINE)" "EJS"
layout:
	@make create-html5-app-layout
	@echo $(EJS_HTML5_LAYOUT) > $(VIEWS_DIRECTORY)/layout.ejs
	@echo $(EJS_404) > $(VIEWS_DIRECTORY)/404.ejs
	@echo $(EJS_500) > $(VIEWS_DIRECTORY)/500.ejs
else
ifeq "$(APP_ENGINE)" "JADE"
layout:
	@make create-html5-app-layout
	@echo $(JADE_HTML5_LAYOUT) > $(VIEWS_DIRECTORY)/layout.jade
	@echo $(JADE_404) > $(VIEWS_DIRECTORY)/404.jade
	@echo $(JADE_500) > $(VIEWS_DIRECTORY)/500.jade
else
layout:
	@echo "ERROR: You cannot define a layout for your project because you haven't define a template engine when creating it."
endif
endif
else
ifeq "$(TYPE)" "html5"
ifeq "$(APP_ENGINE)" "EJS"
layout:
	@make create-html5-app-layout
	@echo $(EJS_HTML5_LAYOUT) > $(VIEWS_DIRECTORY)/layout.ejs
	@echo $(EJS_404) > $(VIEWS_DIRECTORY)/404.ejs
	@echo $(EJS_500) > $(VIEWS_DIRECTORY)/500.ejs
else
ifeq "$(APP_ENGINE)" "JADE"
layout:
	@make create-html5-app-layout
	@echo $(JADE_HTML5_LAYOUT) > $(VIEWS_DIRECTORY)/layout.jade
	@echo $(JADE_404) > $(VIEWS_DIRECTORY)/404.jade
	@echo $(JADE_500) > $(VIEWS_DIRECTORY)/500.jade
else
layout:
	@echo "ERROR: You cannot define a layout for your project because you haven't define a template engine when creating it."
endif
endif
else
ifeq "$(TYPE)" "mobile"
# ...
else
ifeq "$(TYPE)" "bootstrap"
# ...
else
ifeq "$(TYPE)" "jquery"
# ...
else
# ...
endif
endif
endif
endif
endif
else
ifeq "$(TYPE)" ""
ifeq "$(APP_UPPERCASED)_ENGINE" "EJS"
layout:
	@make create-html5-subapp-layout
	@echo $(EJS_HTML5_LAYOUT) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/layout.ejs
	@echo $(EJS_404) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/404.ejs
	@echo $(EJS_500) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/500.ejs
else 
ifeq "$(APP_UPPERCASED)_ENGINE" "JADE"
layout:
	@make create-html5-subapp-layout
	@echo $(JADE_HTML5_LAYOUT) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/layout.jade
	@echo $(JADE_404) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/404.jade
	@echo $(JADE_500) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/500.jade
else
layout:
	@echo "ERROR: You cannot define a layout for the '$(APP)' application on your project because you haven't define a template engine when creating it."
endif
endif
else
ifeq "$(TYPE)" "html5"
ifeq "$(APP_UPPERCASED)_ENGINE" "EJS"
layout:
	@make create-html5-subapp-layout
	@echo $(EJS_HTML5_LAYOUT) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/layout.ejs
	@echo $(EJS_404) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/404.ejs
	@echo $(EJS_500) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/500.ejs
else 
ifeq "$(APP_UPPERCASED)_ENGINE" "JADE"
layout:
	@make create-html5-subapp-layout
	@echo $(JADE_HTML5_LAYOUT) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/layout.jade
	@echo $(JADE_404) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/404.jade
	@echo $(JADE_500) > $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/500.jade
else
layout:
	@echo "ERROR: You cannot define a layout for the '$(APP)' application on your project because you haven't define a template engine when creating it."
endif
endif
else
ifeq "$(TYPE)" "mobile"
# ...
else
ifeq "$(TYPE)" "bootstrap"
# ...
else
ifeq "$(TYPE)" "jquery"
# ...
else
# ...
endif
endif
endif
endif
endif
endif

ifeq "$(NAME)" ""
app:
	@echo "ERROR: You're required to give the NAME argument to the 'app' task to create a new app in your project."
	@echo "SYNTAX: make app NAME=AppName [ENGINE=ejs]"
else
ifeq "$(ENGINE)" "ejs"
ifeq "$(APP_LANGUAGE)" "CS"
app:
	@echo "$(NAME_UPPERCASED)_ENGINE = EJS" >> .lemmy/setup
	@make create-coffeescript-app
else
app:
	@echo "$(NAME_UPPERCASED)_ENGINE = EJS" >> .lemmy/setup
	@make create-javascript-app
endif
else 
ifeq "$(ENGINE)" "jade"
ifeq "$(APP_LANGUAGE)" "CS"
app:
	@echo "$(NAME_UPPERCASED)_ENGINE = JADE" >> .lemmy/setup
	@make create-coffeescript-app
else
app:
	@echo "$(NAME_UPPERCASED)_ENGINE = JADE" >> .lemmy/setup
	@make create-javascript-app
endif
else
ifeq "$(APP_LANGUAGE)" "CS"
app:
	@make create-coffeescript-app
else
app:
	@make create-javascript-app
endif
endif
endif
endif

ifeq "$(NAME)" ""
module:
	@echo "ERROR: You're required to give the NAME argument to the 'module' task to create a new module in your project."
	@echo "SYNTAX: make module NAME=ModuleName [APP=AppName]"
else
ifeq "$(APP)" ""
ifeq "$(APP_LANGUAGE)" "CS"
module:
	@mkdir -p $(SOURCE_DIRECTORY)/$(MODULES_DIRECTORY)
	@echo $(MODULE_CS) > $(SOURCE_DIRECTORY)/$(MODULES_DIRECTORY)/$(NAME_CAMELIZED).coffee
	@mkdir -p $(TESTING_DIRECTORY)/$(MODULES_DIRECTORY)
	@echo $(TESTMODULE_CS) > $(TESTING_DIRECTORY)/$(MODULES_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee
else
module:
	@mkdir -p $(MODULES_DIRECTORY)
	@echo $(MODULE_JS) > $(MODULES_DIRECTORY)/$(NAME_CAMELIZED).js
	@mkdir -p $(TESTING_DIRECTORY)/$(MODULES_DIRECTORY)
	@echo $(TESTMODULE_JS) > $(TESTING_DIRECTORY)/$(MODULES_DIRECTORY)/$(NAME_CAMELIZED)-test.js
endif
else
ifeq "$(APP_LANGUAGE)" "CS"
module:
	@if [ -d "$(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODULES_DIRECTORY); \
		echo $(MODULE_CS) > $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODULES_DIRECTORY)/$(NAME_CAMELIZED).coffee; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODULES_DIRECTORY); \
		echo $(TESTMODULE_CS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODULES_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'module' task to create a new module inside your application."; \
	fi
else
module:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODULES_DIRECTORY); \
		echo $(MODULE_JS) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODULES_DIRECTORY)/$(NAME_CAMELIZED).js; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODULES_DIRECTORY); \
		echo $(TESTMODULE_JS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODULES_DIRECTORY)/$(NAME_CAMELIZED)-test.js; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'module' task to create a new module inside your application."; \
	fi
endif
endif
endif

ifeq "$(NAME)" ""
helper:
	@echo "ERROR: You're required to give the NAME argument to the 'helper' task to create a new helper in your project."
	@echo "SYNTAX: make helper NAME=HelperName [APP=AppName]"
else
ifeq "$(APP)" ""
ifeq "$(APP_LANGUAGE)" "CS"
helper:
	@mkdir -p $(SOURCE_DIRECTORY)/$(HELPERS_DIRECTORY)
	@echo $(HELPER_CS) > $(SOURCE_DIRECTORY)/$(HELPERS_DIRECTORY)/$(NAME_CAMELIZED).coffee
	@mkdir -p $(TESTING_DIRECTORY)/$(HELPERS_DIRECTORY)
	@echo $(TESTHELPER_CS) > $(TESTING_DIRECTORY)/$(HELPERS_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee
else
helper:
	@mkdir -p $(HELPERS_DIRECTORY)
	@echo $(HELPER_JS) > $(HELPERS_DIRECTORY)/$(NAME_CAMELIZED).js
	@mkdir -p $(TESTING_DIRECTORY)/$(HELPERS_DIRECTORY)
	@echo $(TESTHELPER_JS) > $(TESTING_DIRECTORY)/$(HELPERS_DIRECTORY)/$(NAME_CAMELIZED)-test.js
endif
else
ifeq "$(APP_LANGUAGE)" "CS"
helper:
	@if [ -d "$(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(HELPERS_DIRECTORY); \
		echo $(HELPER_CS) > $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(HELPERS_DIRECTORY)/$(NAME_CAMELIZED).coffee; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(HELPERS_DIRECTORY); \
		echo $(TESTHELPER_CS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(HELPERS_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'helper' task to create a new helper inside your application."; \
	fi
else
helper:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(HELPERS_DIRECTORY); \
		echo $(HELPER_JS) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(HELPERS_DIRECTORY)/$(NAME_CAMELIZED).js; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(HELPERS_DIRECTORY); \
		echo $(TESTHELPER_JS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(HELPERS_DIRECTORY)/$(NAME_CAMELIZED)-test.js; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'helper' task to create a new helper inside your application."; \
	fi
endif
endif
endif

ifeq "$(NAME)" ""
middleware:
	@echo "ERROR: You're required to give the NAME argument to the 'middleware' task to create a new middleware in your project."
	@echo "SYNTAX: make middleware NAME=MiddlewareName [APP=AppName]"
else
ifeq "$(APP)" ""
ifeq "$(APP_LANGUAGE)" "CS"
middleware:
	@mkdir -p $(SOURCE_DIRECTORY)/$(MIDDLEWARES_DIRECTORY)
	@echo $(MIDDLEWARE_CS) > $(SOURCE_DIRECTORY)/$(MIDDLEWARES_DIRECTORY)/$(NAME_CAMELIZED).coffee
	@mkdir -p $(TESTING_DIRECTORY)/$(MIDDLEWARES_DIRECTORY)
	@echo $(TESTMIDDLEWARE_CS) > $(TESTING_DIRECTORY)/$(MIDDLEWARES_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee
else
middleware:
	@mkdir -p $(MIDDLEWARES_DIRECTORY)
	@echo $(MIDDLEWARE_JS) > $(MIDDLEWARES_DIRECTORY)/$(NAME_CAMELIZED).js
	@mkdir -p $(TESTING_DIRECTORY)/$(MIDDLEWARES_DIRECTORY)
	@echo $(TESTMIDDLEWARE_JS) > $(TESTING_DIRECTORY)/$(MIDDLEWARES_DIRECTORY)/$(NAME_CAMELIZED)-test.js
endif
else
ifeq "$(APP_LANGUAGE)" "CS"
middleware:
	@if [ -d "$(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MIDDLEWARES_DIRECTORY); \
		echo $(MIDDLEWARE_CS) > $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MIDDLEWARES_DIRECTORY)/$(NAME_CAMELIZED).coffee; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MIDDLEWARES_DIRECTORY); \
		echo $(TESTMIDDLEWARE_CS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MIDDLEWARES_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'middleware' task to create a new middleware inside your application."; \
	fi
else
middleware:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MIDDLEWARES_DIRECTORY); \
		echo $(MIDDLEWARE_JS) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MIDDLEWARES_DIRECTORY)/$(NAME_CAMELIZED).js; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MIDDLEWARES_DIRECTORY); \
		echo $(TESTMIDDLEWARE_JS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MIDDLEWARES_DIRECTORY)/$(NAME_CAMELIZED)-test.js; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'middleware' task to create a new middleware inside your application."; \
	fi
endif
endif
endif

ifeq "$(NAME)" ""
route:
	@echo "ERROR: You're required to give the NAME argument to the 'route' task to create a new route container in your project."
	@echo "SYNTAX: make route NAME=RouteContainerName [APP=AppName]"
else
ifeq "$(APP)" ""
ifeq "$(APP_LANGUAGE)" "CS"
route:
	@mkdir -p $(SOURCE_DIRECTORY)/$(ROUTES_DIRECTORY)
	@echo $(ROUTE_CS) > $(SOURCE_DIRECTORY)/$(ROUTES_DIRECTORY)/$(NAME_CAMELIZED).coffee
	@mkdir -p $(TESTING_DIRECTORY)/$(ROUTES_DIRECTORY)
	@echo $(TESTROUTE_CS) > $(TESTING_DIRECTORY)/$(ROUTES_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee
else
route:
	@mkdir -p $(ROUTES_DIRECTORY)
	@echo $(ROUTE_JS) > $(ROUTES_DIRECTORY)/$(NAME_CAMELIZED).js
	@mkdir -p $(TESTING_DIRECTORY)/$(ROUTES_DIRECTORY)
	@echo $(TESTROUTE_JS) > $(TESTING_DIRECTORY)/$(ROUTES_DIRECTORY)/$(NAME_CAMELIZED)-test.js
endif
else
ifeq "$(APP_LANGUAGE)" "CS"
route:
	@if [ -d "$(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(ROUTES_DIRECTORY); \
		echo $(ROUTE_CS) > $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(ROUTES_DIRECTORY)/$(NAME_CAMELIZED).coffee; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(ROUTES_DIRECTORY); \
		echo $(TESTROUTE_CS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(ROUTES_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'route' task to create a new route inside your application."; \
	fi
else
route:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(ROUTES_DIRECTORY); \
		echo $(ROUTE_JS) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(ROUTES_DIRECTORY)/$(NAME_CAMELIZED).js; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(ROUTES_DIRECTORY); \
		echo $(TESTROUTE_JS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(ROUTES_DIRECTORY)/$(NAME_CAMELIZED)-test.js; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'middleware' task to create a new route inside your application."; \
	fi
endif
endif
endif

ifeq "$(NAME)" ""
controller:
	@echo "ERROR: You're required to give the NAME argument to the 'controller' task to create a new controller in your project."
	@echo "SYNTAX: make controller NAME=ControllerName [APP=AppName]"
else
ifeq "$(APP)" ""
ifeq "$(APP_LANGUAGE)" "CS"
ifeq "$(WITH_VIEWS)" "yes"
controller:
	@if [ -d "$(VIEWS_DIRECTORY)" ]; \
	then \
		mkdir -p $(SOURCE_DIRECTORY)/$(CONTROLLERS_DIRECTORY); \
		echo $(CONTROLLER_CS) > $(SOURCE_DIRECTORY)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED).coffee; \
		mkdir -p $(TESTING_DIRECTORY)/$(CONTROLLERS_DIRECTORY); \
		echo $(TESTCONTROLLER_CS) > $(TESTING_DIRECTORY)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee; \
		make view NAME=Index GROUP=$(NAME); \
		make view NAME=Show GROUP=$(NAME); \
		make view NAME=Edit GROUP=$(NAME); \
		make view NAME=Update GROUP=$(NAME); \
		make view NAME=Remove GROUP=$(NAME); \
	else \
		echo "ERROR: You're required to define a layout on your project to create a controllers with views inside it."; \
	fi
else
controller:
	@mkdir -p $(SOURCE_DIRECTORY)/$(CONTROLLERS_DIRECTORY)
	@echo $(CONTROLLER_CS) > $(SOURCE_DIRECTORY)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED).coffee
	@mkdir -p $(TESTING_DIRECTORY)/$(CONTROLLERS_DIRECTORY)
	@echo $(TESTCONTROLLER_CS) > $(TESTING_DIRECTORY)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee
endif
else
ifeq "$(WITH_VIEWS)" "yes"
controller:
	@if [ -d "$(VIEWS_DIRECTORY)" ]; \
	then \
		mkdir -p $(CONTROLLERS_DIRECTORY); \
		echo $(CONTROLLER_JS) > $(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED).js; \
		mkdir -p $(TESTING_DIRECTORY)/$(CONTROLLERS_DIRECTORY); \
		echo $(TESTCONTROLLER_JS) > $(TESTING_DIRECTORY)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED)-test.js; \
		make view NAME=Index GROUP=$(NAME); \
		make view NAME=Show GROUP=$(NAME); \
		make view NAME=Edit GROUP=$(NAME); \
		make view NAME=Update GROUP=$(NAME); \
		make view NAME=Remove GROUP=$(NAME); \
	else \
		echo "ERROR: You're required to define a layout on your project to create a controllers with views inside it."; \
	fi
else
controller:
	@mkdir -p $(CONTROLLERS_DIRECTORY)
	@echo $(CONTROLLER_JS) > $(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED).js
	@mkdir -p $(TESTING_DIRECTORY)/$(CONTROLLERS_DIRECTORY)
	@echo $(TESTCONTROLLER_JS) > $(TESTING_DIRECTORY)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED)-test.js
endif
endif
else
ifeq "$(APP_LANGUAGE)" "CS"
ifeq "$(WITH_VIEWS)" "yes"
controller:
	@if [ -d "$(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		if [ -d "$(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)" ]; \
			mkdir -p $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY); \
			echo $(CONTROLLER_CS) > $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED).coffee; \
			mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY); \
			echo $(TESTCONTROLLER_CS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee; \
			make view NAME=Index GROUP=$(NAME) APP=$(APP); \
			make view NAME=Show GROUP=$(NAME) AAP=$(APP); \
			make view NAME=Edit GROUP=$(NAME) APP=$(APP); \
			make view NAME=Update GROUP=$(NAME) APP=$(APP); \
			make view NAME=Remove GROUP=$(NAME) APP=$(APP); \
		else \
			echo "ERROR: You're required to define a layout on the '$(APP)' application to create a controllers with views inside it."; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'controller' task to create a new controller inside your application."; \
	fi
else
controller:
	@if [ -d "$(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY); \
		echo $(CONTROLLER_CS) > $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED).coffee; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY); \
		echo $(TESTCONTROLLER_CS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'controller' task to create a new controller inside your application."; \
	fi
endif
else
ifeq "$(WITH_VIEWS)" "yes"
controller:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)" ]; \
			mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY); \
			echo $(CONTROLLER_JS) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED).js; \
			mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY); \
			echo $(TESTCONTROLLER_JS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED)-test.js; \
			make view NAME=Index GROUP=$(NAME) APP=$(APP); \
			make view NAME=Show GROUP=$(NAME) AAP=$(APP); \
			make view NAME=Edit GROUP=$(NAME) APP=$(APP); \
			make view NAME=Update GROUP=$(NAME) APP=$(APP); \
			make view NAME=Remove GROUP=$(NAME) APP=$(APP); \
		else \
			echo "ERROR: You're required to define a layout on the '$(APP)' application to create a controllers with views inside it."; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'controller' task to create a new controller inside your application."; \
	fi
else
controller:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY); \
		echo $(CONTROLLER_JS) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED).js; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY); \
		echo $(TESTCONTROLLER_JS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(CONTROLLERS_DIRECTORY)/$(NAME_CAMELIZED)-test.js; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'controller' task to create a new controller inside your application."; \
	fi
endif
endif
endif
endif

ifeq "$(NAME)" ""
model:
	@echo "ERROR: You're required to give the NAME argument to the 'model' task to create a new model in your project."
	@echo "SYNTAX: make model NAME=ModelName [APP=AppName]"
else
ifeq "$(APP)" ""
ifeq "$(APP_LANGUAGE)" "CS"
model:
	@mkdir -p $(SOURCE_DIRECTORY)/$(MODELS_DIRECTORY)
	@echo $(MODEL_CS) > $(SOURCE_DIRECTORY)/$(MODELS_DIRECTORY)/$(NAME_CAMELIZED).coffee
	@mkdir -p $(TESTING_DIRECTORY)/$(MODELS_DIRECTORY)
	@echo $(TESTMODEL_CS) > $(TESTING_DIRECTORY)/$(MODELS_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee
else
model:
	@mkdir -p $(MODELS_DIRECTORY)
	@echo $(MODEL_JS) > $(MODELS_DIRECTORY)/$(NAME_CAMELIZED).js
	@mkdir -p $(TESTING_DIRECTORY)/$(MODELS_DIRECTORY)
	@echo $(TESTMODEL_JS) > $(TESTING_DIRECTORY)/$(MODELS_DIRECTORY)/$(NAME_CAMELIZED)-test.js
endif
else
ifeq "$(APP_LANGUAGE)" "CS"
model:
	@if [ -d "$(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODELS_DIRECTORY); \
		echo $(MODEL_CS) > $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODELS_DIRECTORY)/$(NAME_CAMELIZED).coffee; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODELS_DIRECTORY); \
		echo $(TESTMODEL_CS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODELS_DIRECTORY)/$(NAME_CAMELIZED)-test.coffee; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'model' task to create a new model inside your application."; \
	fi
else
model:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODELS_DIRECTORY); \
		echo $(MODEL_JS) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODELS_DIRECTORY)/$(NAME_CAMELIZED).js; \
		mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODELS_DIRECTORY); \
		echo $(TESTMODEL_JS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(MODELS_DIRECTORY)/$(NAME_CAMELIZED)-test.js; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'model' task to create a new model inside your application."; \
	fi
endif
endif
endif

ifeq "$(NAME)" ""
view:
	@echo "ERROR: You're required to give the NAME argument to the 'view' task to create a new view in your project."
	@echo "SYNTAX: make view NAME=ViewName [GROUP=GroupName] [APP=AppName]"
else
ifeq "$(GROUP)" ""
ifeq "$(APP)" ""
ifeq "$(APP_ENGINE)" "EJS"
view:
	@if [ -d "$(VIEWS_DIRECTORY)" ]; \
	then \
		echo $(EJS_VIEW) > $(VIEWS_DIRECTORY)/$(NAME_CAMELIZED).ejs; \
	else \
		echo "ERROR: You're required to define a layout on your project to create a view inside it."; \
	fi
else
view:
	@if [ -d "$(VIEWS_DIRECTORY)" ]; \
	then \
		echo $(JADE_VIEW) > $(VIEWS_DIRECTORY)/$(NAME_CAMELIZED).jade; \
	else \
		echo "ERROR: You're required to define a layout on your project to create a view inside it."; \
	fi
endif
else
ifeq "$(APP_UPPERCASED)_ENGINE" "EJS"
view:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)" ]; \
	then \
		echo $(EJS_VIEW) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(NAME_CAMELIZED).ejs; \
	else \
		echo "ERROR: You're required to define a layout for the '$(APP)' application to create a view inside it."; \
	fi
else
view:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)" ]; \
	then \
		echo $(JADE_VIEW) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(NAME_CAMELIZED).jade; \
	else \
		echo "ERROR: You're required to define a layout for the '$(APP)' application to create a view inside it."; \
	fi
endif
endif
else
ifeq "$(APP)" ""
ifeq "$(APP_ENGINE)" "EJS"
view:
	@if [ -d "$(VIEWS_DIRECTORY)" ]; \
	then \
		mkdir -p $(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED); \
		echo $(EJS_VIEW) > $(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED)/$(NAME_CAMELIZED).ejs; \
	else \
		echo "ERROR: You're required to define a layout on your project to create a view inside it."; \
	fi
else
view:
	@if [ -d "$(VIEWS_DIRECTORY)" ]; \
	then \
		mkdir -p $(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED); \
		echo $(JADE_VIEW) > $(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED)/$(NAME_CAMELIZED).jade; \
	else \
		echo "ERROR: You're required to define a layout on your project to create a view inside it."; \
	fi
endif
else
ifeq "$(APP_UPPERCASED)_ENGINE" "EJS"
view:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)" ]; \
	then \
		mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED); \
		echo $(EJS_VIEW) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED)/$(NAME_CAMELIZED).ejs; \
	else \
		echo "ERROR: You're required to define a layout for the '$(APP)' application to create a view inside it."; \
	fi
else
view:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)" ]; \
	then \
		mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED); \
		echo $(JADE_VIEW) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED)/$(NAME_CAMELIZED).jade; \
	else \
		echo "ERROR: You're required to define a layout for the '$(APP)' application to create a view inside it."; \
	fi
endif
endif
endif
endif

ifeq "$(NAME)" ""
partial:
	@echo "ERROR: You're required to give the NAME argument to the 'partial' task to create a new partial in your project."
	@echo "SYNTAX: make partial NAME=ViewName [GROUP=GroupName] [APP=AppName]"
else
ifeq "$(GROUP)" ""
ifeq "$(APP)" ""
ifeq "$(APP_ENGINE)" "EJS"
partial:
	@if [ -d "$(VIEWS_DIRECTORY)" ]; \
	then \
		echo $(EJS_PARTIAL) > $(VIEWS_DIRECTORY)/$(PARTIAL_CAMELIZED).ejs; \
	else \
		echo "ERROR: You're required to define a layout on your project to create a partial inside it."; \
	fi
else
partial:
	@if [ -d "$(VIEWS_DIRECTORY)" ]; \
	then \
		echo $(JADE_PARTIAL) > $(VIEWS_DIRECTORY)/$(PARTIAL_CAMELIZED).jade; \
	else \
		echo "ERROR: You're required to define a layout on your project to create a partial inside it."; \
	fi
endif
else
ifeq "$(APP_UPPERCASED)_ENGINE" "EJS"
partial:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)" ]; \
	then \
		echo $(EJS_PARTIAL) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(PARTIAL_CAMELIZED).ejs; \
	else \
		echo "ERROR: You're required to define a layout for the '$(APP)' application to create a partial inside it."; \
	fi
else
partial:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)" ]; \
	then \
		echo $(JADE_PARTIAL) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(PARTIAL_CAMELIZED).jade; \
	else \
		echo "ERROR: You're required to define a layout for the '$(APP)' application to create a partial inside it."; \
	fi
endif
endif
else
ifeq "$(APP)" ""
ifeq "$(APP_ENGINE)" "EJS"
partial:
	@if [ -d "$(VIEWS_DIRECTORY)" ]; \
	then \
		mkdir -p $(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED); \
		echo $(EJS_PARTIAL) > $(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED)/$(PARTIAL_CAMELIZED).ejs; \
	else \
		echo "ERROR: You're required to define a layout on your project to create a view inside it."; \
	fi
else
partial:
	@if [ -d "$(VIEWS_DIRECTORY)" ]; \
	then \
		mkdir -p $(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED); \
		echo $(JADE_PARTIAL) > $(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED)/$(PARTIAL_CAMELIZED).jade; \
	else \
		echo "ERROR: You're required to define a layout on your project to create a view inside it."; \
	fi
endif
else
ifeq "$(APP_UPPERCASED)_ENGINE" "EJS"
partial:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)" ]; \
	then \
		mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED); \
		echo $(EJS_PARTIAL) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED)/$(PARTIAL_CAMELIZED).ejs; \
	else \
		echo "ERROR: You're required to define a layout for the '$(APP)' application to create a partial inside it."; \
	fi
else
partial:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)" ]; \
	then \
		mkdir -p $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED); \
		echo $(JADE_PARTIAL) > $(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(VIEWS_DIRECTORY)/$(GROUP_CAMELIZED)/$(PARTIAL_CAMELIZED).jade; \
	else \
		echo "ERROR: You're required to define a layout for the '$(APP)' application to create a partial inside it."; \
	fi
endif
endif
endif
endif

ifeq "$(APP_LANGUAGE)" "CS"
build:
	@$(COFFEE) --compile --output . $(SOURCE_DIRECTORY)
	@if [ -d "$(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)" ]; then $(COFFEE) --compile --output $(APPS_DIRECTORY) $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY); fi
	@if [ -d "$(SOURCE_DIRECTORY)/$(MODULES_DIRECTORY)" ]; then $(COFFEE) --compile --output $(MODULES_DIRECTORY) $(SOURCE_DIRECTORY)/$(MODULES_DIRECTORY); fi
	@if [ -d "$(SOURCE_DIRECTORY)/$(HELPERS_DIRECTORY)" ]; then $(COFFEE) --compile --output $(HELPERS_DIRECTORY) $(SOURCE_DIRECTORY)/$(HELPERS_DIRECTORY); fi 
	@if [ -d "$(SOURCE_DIRECTORY)/$(MIDDLEWARES_DIRECTORY)" ];	then $(COFFEE) --compile --output $(MIDDLEWARES_DIRECTORY) $(SOURCE_DIRECTORY)/$(MIDDLEWARES_DIRECTORY); fi
	@if [ -d "$(SOURCE_DIRECTORY)/$(ROUTES_DIRECTORY)" ]; then $(COFFEE) --compile --output $(ROUTES_DIRECTORY) $(SOURCE_DIRECTORY)/$(ROUTES_DIRECTORY); fi
	@if [ -d "$(SOURCE_DIRECTORY)/$(CONTROLLERS_DIRECTORY)" ]; then $(COFFEE) --compile --output $(CONTROLLERS_DIRECTORY) $(SOURCE_DIRECTORY)/$(CONTROLLERS_DIRECTORY); fi
	@if [ -d "$(SOURCE_DIRECTORY)/$(MODELS_DIRECTORY)" 	]; then $(COFFEE) --compile --output $(MODELS_DIRECTORY) $(SOURCE_DIRECTORY)/$(MODELS_DIRECTORY); fi
endif

ifeq "$(APP_LANGUAGE)" "CS"
watch:
	$(JITTER) $(SOURCE_DIRECTORY) . $(TEST_DIRECTORY)
endif

run:
	@NODE_ENV=development node app.js

run-as-production:
	@NODE_ENV=production node app.js

ifeq "$(APP_LANGUAGE)" "CS"
test:
	@NODE_ENV=test $(MOCHA) \
		--require $(TEST_DEPENDENCY) \
		--reporter $(TEST_REPORTER) \
		--ui $(TEST_INTERFACE) \
		--slow $(TEST_THRESHOLD) \
		--compilers $(TEST_COMPILERS_CS) \
		--colors \
		$(TEST_FILES_CS)
else
test:
	@NODE_ENV=test $(MOCHA) \
		--require $(TEST_DEPENDENCY) \
		--reporter $(TEST_REPORTER) \
		--ui $(TEST_INTERFACE) \
		--slow $(TEST_THRESHOLD) \
		--colors \
		--watch \
		$(TEST_FILES_JS)
endif

ifeq "$(APP_LANGUAGE)" "CS"
prepare:
	@make build
	@make dependencies APP_ENVIRONMENT=production
	@make move_files-to-deployment-folder
else
prepare:
	@make clean
	@make dependencies APP_ENVIRONMENT=production
	@make move-files-to-deployment-folder
endif

.PHONY: help version clean create update mit-license dependencies layout app module middleware route controller model view build watch run run-as-production test prepare

# Helpers

git-init:
	@git init
	@git add .
	@git commit -m "Initial commit."
	@git checkout -b development

setup-javascript-project:
	@rm -rf .git
	@rm README.md LICENSE .gitignore
	@echo $(PACKAGE) > package.json
	@echo $(GITIGNORE) | sed 's/ //g' > .gitignore
	@mkdir -p $(TESTING_DIRECTORY)
	@echo $(APP_JS) > app.js

setup-coffeescript-project:
	@rm -rf .git
	@rm README.md LICENSE .gitignore
	@echo $(PACKAGE) > package.json
	@echo $(GITIGNORE) | sed 's/ //g' > .gitignore
	@echo "APP_LANGUAGE = CS" >> .lemmy/setup
	@mkdir -p $(SOURCE_DIRECTORY)
	@mkdir -p $(TESTING_DIRECTORY)
	@echo $(APP_CS) > $(SOURCE_DIRECTORY)/app.coffee

create-javascript-app:
	@mkdir -p $(APPS_DIRECTORY)/$(NAME_CAMELIZED)
	@echo $(SUBAPP_JS) > $(APPS_DIRECTORY)/$(NAME_CAMELIZED)/app.js
	@mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(NAME_CAMELIZED)
	@echo $(TESTSUBAPP_JS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(NAME_CAMELIZED)/app-test.js

create-coffeescript-app:
	@mkdir -p $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(NAME_CAMELIZED)
	@echo $(SUBAPP_CS) > $(SOURCE_DIRECTORY)/$(APPS_DIRECTORY)/$(NAME_CAMELIZED)/app.coffee
	@mkdir -p $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(NAME_CAMELIZED)
	@echo $(TESTSUBAPP_CS) > $(TESTING_DIRECTORY)/$(APPS_DIRECTORY)/$(NAME_CAMELIZED)/app-test.coffee

create-html5-app-layout:
	@make download-1140-css-grid
	@git clone https://github.com/h5bp/html5-boilerplate.git $(TEMPORARY_HTML5_DIRECTORY)
	@mkdir -p $(VIEWS_DIRECTORY)
	@mkdir -p $(PUBLIC_DIRECTORY)/$(STYLES_DIRECTORY)
	@mkdir -p $(PUBLIC_DIRECTORY)/$(IMAGES_DIRECTORY)
	@mkdir -p $(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY)
	@mv $(TEMPORARY_HTML5_DIRECTORY)/*.txt $(PUBLIC_DIRECTORY)
	@mv $(TEMPORARY_HTML5_DIRECTORY)/*.png $(PUBLIC_DIRECTORY)
	@mv $(TEMPORARY_HTML5_DIRECTORY)/*.ico $(PUBLIC_DIRECTORY)
	@mv $(TEMPORARY_HTML5_DIRECTORY)/$(STYLES_DIRECTORY)/*.css $(PUBLIC_DIRECTORY)/$(STYLES_DIRECTORY)
	@mv $(TEMPORARY_1140_DIRECTORY)/$(STYLES_DIRECTORY)/1140.css $(PUBLIC_DIRECTORY)/$(STYLES_DIRECTORY)
	@mv $(TEMPORARY_1140_DIRECTORY)/$(STYLES_DIRECTORY)/ie.css $(PUBLIC_DIRECTORY)/$(STYLES_DIRECTORY)
	@mv $(TEMPORARY_HTML5_DIRECTORY)/$(SCRIPTS_DIRECTORY)/main.js $(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY)
	@mv $(TEMPORARY_HTML5_DIRECTORY)/$(SCRIPTS_DIRECTORY)/plugins.js $(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY)
	@mv $(TEMPORARY_HTML5_DIRECTORY)/$(SCRIPTS_DIRECTORY)/vendor/jquery-*.min.js $(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY)/jquery.js
	@mv $(TEMPORARY_HTML5_DIRECTORY)/$(SCRIPTS_DIRECTORY)/vendor/modernizr-*.min.js $(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY)/modernizr.js
	@mv $(TEMPORARY_1140_DIRECTORY)/$(SCRIPTS_DIRECTORY)/*.js $(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY)/css3-queries.js
	@rm -rf $(TEMPORARY_DIRECTORY)
	@echo "APP_LAYOUT = HTML5" >> .lemmy/setup

create-html5-subapp-layout:
	@if [ -d "$(APPS_DIRECTORY)/$(APP_CAMELIZED)" ]; \
	then \
		make download-1140-css-grid; \
		git clone https://github.com/h5bp/html5-boilerplate.git $(TEMPORARY_HTML5_DIRECTORY); \
		mkdir -p $(VIEWS_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED); \
		mkdir -p $(PUBLIC_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(STYLES_DIRECTORY); \
		mkdir -p $(PUBLIC_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(IMAGES_DIRECTORY); \
		mkdir -p $(PUBLIC_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(SCRIPTS_DIRECTORY); \
		mv $(TEMPORARY_HTML5_DIRECTORY)/*.txt $(PUBLIC_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/; \
		mv $(TEMPORARY_HTML5_DIRECTORY)/*.png $(PUBLIC_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED); \
		mv $(TEMPORARY_HTML5_DIRECTORY)/*.ico $(PUBLIC_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/; \
		mv $(TEMPORARY_1140_DIRECTORY)/$(STYLES_DIRECTORY)/1140.css $(PUBLIC_DIRECTORY)/$(STYLES_DIRECTORY); \
		mv $(TEMPORARY_1140_DIRECTORY)/$(STYLES_DIRECTORY)/ie.css $(PUBLIC_DIRECTORY)/$(STYLES_DIRECTORY); \
		mv $(TEMPORARY_HTML5_DIRECTORY)/$(STYLES_DIRECTORY)/*.css $(PUBLIC_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(STYLES_DIRECTORY); \
		mv $(TEMPORARY_HTML5_DIRECTORY)/$(SCRIPTS_DIRECTORY)/main.js $(PUBLIC_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(SCRIPTS_DIRECTORY); \
		mv $(TEMPORARY_HTML5_DIRECTORY)/$(SCRIPTS_DIRECTORY)/plugins.js $(PUBLIC_DIRECTORY)/$(APPS_DIRECTORY)/$(APP_CAMELIZED)/$(SCRIPTS_DIRECTORY); \
		if [ ! -f "$(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY)/main.js" ]; \
		then \
			mkdir -p $(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY); \
			mv $(TEMPORARY_HTML5_DIRECTORY)/$(SCRIPTS_DIRECTORY)/vendor/jquery-*.min.js $(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY)/jquery.js; \
			mv $(TEMPORARY_HTML5_DIRECTORY)/$(SCRIPTS_DIRECTORY)/vendor/modernizr-*.min.js $(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY)/modernizr.js; \
			mv $(TEMPORARY_1140_DIRECTORY)/$(SCRIPTS_DIRECTORY)/*.js $(PUBLIC_DIRECTORY)/$(SCRIPTS_DIRECTORY)/css3-queries.js; \
		fi; \
		rm -rf $(TEMPORARY_DIRECTORY); \
		echo "$(APP_UPPERCASED)_LAYOUT = HTML5" >> .lemmy/setup; \
	else \
		echo "ERROR: You're required to give an existing APP argument to the 'layout' task to create a new layout inside your application."; \
	fi

download-1140-css-grid:
	@curl -C - -O http://download.cssgrid.net/1140_CssGrid_2.zip
	@mkdir -p $(TEMPORARY_1140_DIRECTORY)
	@unzip 1140_CssGrid_2.zip -d $(TEMPORARY_1140_DIRECTORY)
	@rm 1140_CssGrid_2.zip

move-files-to-deployment-folder:
	@mkdir $(DEPLOYMENT_DIRECTORY)
	@cp $(APP_FILE) $(DEPLOYMENT_DIRECTORY)
	@if [ -d "$(APPS_DIRECTORY)" ]; then cp -r $(APPS_DIRECTORY) $(DEPLOYMENT_DIRECTORY); fi
	@if [ -d "$(MODULES_DIRECTORY)" ]; then cp -r $(MODULES_DIRECTORY) $(DEPLOYMENT_DIRECTORY); fi
	@if [ -d "$(HELPERS_DIRECTORY)" ]; then cp -r $(HELPERS_DIRECTORY) $(DEPLOYMENT_DIRECTORY); fi
	@if [ -d "$(MIDDLEWARES_DIRECTORY)" ]; then cp -r $(MIDDLEWARES_DIRECTORY) $(DEPLOYMENT_DIRECTORY); fi
	@if [ -d "$(ROUTES_DIRECTORY)" ]; then cp -r $(ROUTES_DIRECTORY) $(DEPLOYMENT_DIRECTORY); fi
	@if [ -d "$(CONTROLLERS_DIRECTORY)" ]; then cp -r $(CONTROLLERS_DIRECTORY) $(DEPLOYMENT_DIRECTORY); fi
	@if [ -d "$(MODELS_DIRECTORY)" ]; then cp -r $(MODELS_DIRECTORY) $(DEPLOYMENT_DIRECTORY); fi
	@if [ -d "$(DEPENDENCIES_DIRECTORY)" ]; then cp -r $(DEPENDENCIES_DIRECTORY) $(DEPLOYMENT_DIRECTORY); fi
