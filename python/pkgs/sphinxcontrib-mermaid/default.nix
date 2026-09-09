{
  buildPythonPackage,
  fetchPypi,
  hatchling,
  sphinx,
  pyyaml,
  rst2pdf,
  lib,
}:
buildPythonPackage rec {
  pname = "sphinxcontrib-mermaid";
  version = "2.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "sphinxcontrib_mermaid";
    hash = "sha256-+NfxsvCtabfr3Vy/Uy+07hB4k7U3O8LQ6WNAicCyz+4=";
  };

  build-system = [ hatchling ];

  dependencies = [
    sphinx
    pyyaml
    rst2pdf
  ];

  pythonImportsCheck = [ "sphinxcontrib.mermaid" ];

  meta = {
    description = "Mermaid diagrams in yours sphinx powered docs";
    homepage = "https://github.com/mgaitan/sphinxcontrib-mermaid";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
