{
  lib,
  asgiref,
  buildPythonPackage,
  daphne,
  django,
  fetchFromGitHub,
  async-timeout,
  pytest-asyncio,
  pytest-django,
  setuptools,
}:

buildPythonPackage rec {
  pname = "channels";
  version = "4.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django";
    repo = "channels";
    tag = version;
    hash = "sha256-KBjxaK2j9Xbz35IHqZK68cSLkUk4B7t+J7omcQAtuFM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asgiref
    django
  ];

  optional-dependencies = {
    daphne = [ daphne ];
  };
  pythonImportsCheck = [ "channels" ];

  meta = {
    description = "Brings event-driven capabilities to Django with a channel system";
    homepage = "https://github.com/django/channels";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
