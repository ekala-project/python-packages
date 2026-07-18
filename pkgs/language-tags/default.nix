{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "language-tags";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "OnroerendErfgoed";
    repo = "language-tags";
    tag = version;
    hash = "sha256-T9K290seKhQLqW36EfA9kn3WveKCmyjN4Mx2j50qIEk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "language_tags" ];

  meta = {
    description = "Dealing with IANA language tags in Python";
    homepage = "https://language-tags.readthedocs.io/en/latest/";
    license = lib.licenses.mit;
  };
}
