{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytz,
}:

buildPythonPackage rec {
  pname = "ciso8601";
  version = "2.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "closeio";
    repo = "ciso8601";
    tag = "v${version}";
    hash = "sha256-14HiCn8BPALPaW53k118lHb5F4oG9mMNN6sdLdKB6v0=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "ciso8601" ];

  meta = {
    description = "Fast ISO8601 date time parser for Python written in C";
    homepage = "https://github.com/closeio/ciso8601";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
