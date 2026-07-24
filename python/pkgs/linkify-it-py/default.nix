{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  uc-micro-py,
  setuptools,
}:

buildPythonPackage rec {
  pname = "linkify-it-py";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tsutsu3";
    repo = "linkify-it-py";
    tag = "v${version}";
    hash = "sha256-EH+HMObryyqZ5mg5N6H1mhmhaoMyCrA+MJhGdkXd3gA=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ uc-micro-py ];

  pythonImportsCheck = [ "linkify_it" ];

  meta = {
    description = "Links recognition library with full unicode support";
    homepage = "https://github.com/tsutsu3/linkify-it-py";
    license = lib.licenses.mit;
  };
}
