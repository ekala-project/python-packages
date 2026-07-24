{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pydantic,
  typing-extensions,
  semver,
  pendulum,
  pymongo,
  pytz,
  tzdata,
}:

buildPythonPackage rec {
  pname = "pydantic-extra-types";
  version = "2.11.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "pydantic-extra-types";
    tag = "v${version}";
    hash = "sha256-O8pw9oX+7hthg4/WtPAQXFwXT6qqan0xRGlE2Er7gtk=";
  };

  build-system = [ hatchling ];

  dependencies = [
    pydantic
    typing-extensions
  ];

  optional-dependencies = {
    all = [
      pendulum
      pymongo
      pytz
      semver
      tzdata
    ];
    semver = [ semver ];
    pendulum = [ pendulum ];
  };

  pythonImportsCheck = [ "pydantic_extra_types" ];

  meta = {
    description = "Extra Pydantic types";
    homepage = "https://github.com/pydantic/pydantic-extra-types";
    license = lib.licenses.mit;
  };
}
