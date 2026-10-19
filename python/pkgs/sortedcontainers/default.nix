{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
}:

let
  sortedcontainers = buildPythonPackage rec {
    pname = "sortedcontainers";
    version = "2.4.0";
    format = "setuptools";

    src = fetchFromGitHub {
      owner = "grantjenks";
      repo = "python-sortedcontainers";
      tag = "v${version}";
      hash = "sha256-YRbSM2isWi7AzfquFvuZBlpEMNUnBJTBLBn0/XYVHKQ=";
    };

    pythonImportsCheck = [ "sortedcontainers" ];
    meta = {
      description = "Python Sorted Container Types: SortedList, SortedDict, and SortedSet";
      homepage = "https://grantjenks.com/docs/sortedcontainers/";
      license = lib.licenses.asl20;
    };
  };
in
sortedcontainers
