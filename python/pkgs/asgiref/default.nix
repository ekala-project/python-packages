{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  version = "3.11.0";
  pname = "asgiref";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django";
    repo = "asgiref";
    tag = finalAttrs.version;
    hash = "sha256-2ZaUIWGF5cQVNj95b7WiKGsn2wYsoJmJ/CfPhIEZdjc=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "asgiref" ];

  meta = {
    description = "Reference ASGI adapters and channel layers";
    homepage = "https://github.com/django/asgiref";
    license = lib.licenses.bsd3;
  };
})
