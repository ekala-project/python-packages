{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "decorator";
  version = "5.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "micheles";
    repo = "decorator";
    tag = version;
    hash = "sha256-UBjZ8LdgJ6iLBjNTlA3up0qAVBqTSZMJt7oEhUo3ZEo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "decorator" ];

  meta = {
    homepage = "https://github.com/micheles/decorator";
    description = "Better living through Python with decorators";
    license = lib.licenses.bsd2;
  };
}
