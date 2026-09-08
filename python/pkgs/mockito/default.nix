{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatch-vcs,
  hatchling,
}:

buildPythonPackage rec {
  pname = "mockito";
  version = "2.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-00HyKMW1zPPEc3UfbG8J2Ng8XaSYRqbuMetgtlYH4O8=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  pythonImportsCheck = [ "mockito" ];

  meta = {
    description = "Spying framework";
    homepage = "https://github.com/kaste/mockito-python";
    license = lib.licenses.mit;
  };
}
