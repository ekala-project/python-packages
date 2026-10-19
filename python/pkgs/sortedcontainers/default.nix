{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

let
  sortedcontainers = buildPythonPackage rec {
    pname = "sortedcontainers";
    version = "2.4.0";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "grantjenks";
      repo = "python-sortedcontainers";
      tag = "v${version}";
      hash = "sha256-YRbSM2isWi7AzfquFvuZBlpEMNUnBJTBLBn0/XYVHKQ=";
    };

  build-system = [ setuptools ];

    pythonImportsCheck = [ "sortedcontainers" ];
    meta = {
      description = "Python Sorted Container Types: SortedList, SortedDict, and SortedSet";
      homepage = "https://grantjenks.com/docs/sortedcontainers/";
      license = lib.licenses.asl20;
    };
  };
in
sortedcontainers
