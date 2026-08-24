{ lib
, buildPythonPackage
, fetchFromGitHub
, pbr
, sphinx
,
}:

buildPythonPackage rec {
  pname = "sphinxcontrib-fulltoc";
  version = "1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sphinx-contrib";
    repo = "fulltoc";
    tag = version;
    hash = "sha256-rpzKiZgsuAqhLDEYURv77SDJny3eqfj0VtJ1tqT29IQ=";
  };

  env.PBR_VERSION = version;

  build-system = [ pbr ];

  dependencies = [ sphinx ];

  # Module has no unit tests

  pythonImportsCheck = [ "sphinxcontrib.fulltoc" ];

  pythonNamespaces = [ "sphinxcontrib" ];

  meta = {
    description = "Include a full table of contents in your Sphinx HTML sidebar";
    homepage = "https://sphinxcontrib-fulltoc.readthedocs.org/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
