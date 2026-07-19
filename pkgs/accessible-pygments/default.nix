{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
  hatch-fancy-pypi-readme,
  pygments,
}:

buildPythonPackage rec {
  pname = "accessible-pygments";
  version = "0.0.5";
  pyproject = true;

  src = fetchPypi {
    pname = "accessible_pygments";
    inherit version;
    hash = "sha256-QJGNPmorYZrUJMuR5Va9O9iGVEPZ8i8dzfeeM8gEaHI=";
  };

  build-system = [
    hatchling
    hatch-vcs
    hatch-fancy-pypi-readme
  ];

  dependencies = [ pygments ];

  doCheck = false;

  pythonImportsCheck = [
    "a11y_pygments"
    "a11y_pygments.utils"
  ];

  meta = {
    description = "Collection of accessible pygments styles";
    homepage = "https://github.com/Quansight-Labs/accessible-pygments";
    license = lib.licenses.bsd3;
  };
}
