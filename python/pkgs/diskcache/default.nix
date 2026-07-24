{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "diskcache";
  version = "5.6.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "grantjenks";
    repo = "python-diskcache";
    rev = "v${version}";
    hash = "sha256-1cDpdf+rLaG14TDd1wEHAiYXb69NFTFeOHD1Ib1oOVY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "diskcache" ];

  meta = {
    description = "Disk and file backed persistent cache";
    homepage = "https://github.com/grantjenks/python-diskcache";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
