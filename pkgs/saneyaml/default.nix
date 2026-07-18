{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools-scm,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "saneyaml";
  version = "0.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Gc+9i/lNcwmYFix5D+XOyau1MAzFiQ/jfcbbyqj7Frs=";
  };

  dontConfigure = true;

  build-system = [ setuptools-scm ];

  dependencies = [ pyyaml ];

  pythonImportsCheck = [ "saneyaml" ];

  meta = {
    description = "PyYaml wrapper with sane behaviour to read and write readable YAML safely";
    homepage = "https://github.com/nexB/saneyaml";
    license = lib.licenses.asl20;
  };
}
