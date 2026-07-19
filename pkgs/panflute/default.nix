{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  click,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "panflute";
  version = "2.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XxvQKjTvOYLuAl7FtY+zpu7fwx2ZS4rjnY3JkVotjx8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    pyyaml
  ];

  pythonImportsCheck = [ "panflute" ];

  meta = {
    description = "Pythonic alternative to John MacFarlane's pandocfilters";
    homepage = "https://scorreia.com/software/panflute";
    license = lib.licenses.bsd3;
  };
}
