{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pydantic,
  typing-extensions,
  cron-converter,
  semver,
  pendulum,
  phonenumbers,
  pycountry,
  pymongo,
  python-ulid,
  pytz,
  tzdata,
}:

buildPythonPackage rec {
  pname = "pydantic-extra-types";
  version = "2.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "pydantic-extra-types";
    tag = "v${version}";
    hash = "sha256-aXhlfDBCpk8h3F4gXAQ40fVKxsoFvkmfO/roaqrGxho=";
  };

  build-system = [ hatchling ];

  dependencies = [
    pydantic
    typing-extensions
  ];

  optional-dependencies = {
    all = [
      cron-converter
      pendulum
      phonenumbers
      pycountry
      pymongo
      python-ulid
      pytz
      semver
      tzdata
    ];
    cron = [ cron-converter ];
    phonenumbers = [ phonenumbers ];
    pycountry = [ pycountry ];
    semver = [ semver ];
    python_ulid = [ python-ulid ];
    pendulum = [ pendulum ];
  };

  pythonImportsCheck = [ "pydantic_extra_types" ];

  meta = {
    description = "Extra Pydantic types";
    homepage = "https://github.com/pydantic/pydantic-extra-types";
    license = lib.licenses.mit;
  };
}
