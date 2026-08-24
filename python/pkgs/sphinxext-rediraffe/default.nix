{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  sphinx,
  flit-core,
}:

buildPythonPackage rec {
  pname = "sphinxext-rediraffe";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wpilibsuite";
    repo = "sphinxext-rediraffe";
    tag = "v${version}";
    hash = "sha256-OW+MNQbPfJa8+jcpWZxTKD+EAv1gyo5tmcYAGba4u3c=";
  };

  build-system = [ flit-core ];

  dependencies = [
    sphinx
  ];

  pythonImportsCheck = [ "sphinxext.rediraffe" ];

  pythonNamespaces = [ "sphinxext" ];

  meta = {
    description = "Sphinx extension to redirect files";
    homepage = "https://github.com/wpilibsuite/sphinxext-rediraffe";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
