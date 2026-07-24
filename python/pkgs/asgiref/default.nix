{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  typing-extensions,
}:

buildPythonPackage rec {
  version = "3.11.0";
  pname = "asgiref";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "django";
    repo = "asgiref";
    tag = version;
    hash = "sha256-2ZaUIWGF5cQVNj95b7WiKGsn2wYsoJmJ/CfPhIEZdjc=";
  };

  propagatedBuildInputs = [ typing-extensions ];

  pythonImportsCheck = [ "asgiref" ];

  meta = {
    description = "Reference ASGI adapters and channel layers";
    homepage = "https://github.com/django/asgiref";
    license = lib.licenses.bsd3;
  };
}
