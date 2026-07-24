{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  ipython,
  requests,
  setuptools,
  tornado,
}:

buildPythonPackage rec {
  pname = "snakeviz";
  version = "2.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jiffyclub";
    repo = "snakeviz";
    tag = "v${version}";
    hash = "sha256-s/OATRnkooucRkLer5A66X9xDEA7aKNo+c10m1N7Guw=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ tornado ];
  pythonImportsCheck = [ "snakeviz" ];
  meta = {
    description = "Browser based viewer for profiling data";
    mainProgram = "snakeviz";
    homepage = "https://jiffyclub.github.io/snakeviz";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
