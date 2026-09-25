{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage rec {
  pname = "click";
  version = "8.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pallets";
    repo = "click";
    tag = version;
    hash = "sha256-VYdaEN9l2MRVz42I8t8IDOpG5XeDM8bf34dLZy3yf10=";
  };

  build-system = [ flit-core ];
  meta = {
    homepage = "https://click.palletsprojects.com/";
    description = "Create beautiful command line interfaces in Python";
    longDescription = ''
      A Python package for creating beautiful command line interfaces in a
      composable way, with as little code as necessary.
    '';
    license = lib.licenses.bsd3;
  };
}
