{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,

  # build-system
  flit-core,
}:

buildPythonPackage rec {
  pname = "loguru";
  version = "0.7.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Delgan";
    repo = "loguru";
    tag = version;
    hash = "sha256-tccEzzs9TtFAZM9s43cskF9llc81Ng28LqedjLiE1m4=";
  };

  patches = [
    (fetchpatch {
      # python 3.14 compat
      url = "https://github.com/Delgan/loguru/commit/84023e2bd8339de95250470f422f096edcb8f7b7.patch";
      hash = "sha256-yXRSwI7Yjm1myL20EoU/jVuEdadmbMlCpP19YKn1MAU=";
    })
  ];

  build-system = [ flit-core ];

  pythonImportsCheck = [ "loguru" ];

  meta = {
    description = "Python logging made (stupidly) simple";
    homepage = "https://github.com/Delgan/loguru";
    license = lib.licenses.mit;
  };
}
