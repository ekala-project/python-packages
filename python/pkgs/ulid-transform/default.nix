{
  lib,
  cython,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ulid-transform";
  version = "2.2.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bdraco";
    repo = "ulid-transform";
    tag = "v${version}";
    hash = "sha256-j4nDvTR7qNpzYor6Pgfp+KNux7FRKdSc7jmuWj94WMM=";
  };

  postPatch = ''
    substituteInPlace build_ext.py \
      --replace-fail "from distutils.command.build_ext import build_ext" \
                     "from setuptools.command.build_ext import build_ext" \
      --replace-fail "from distutils.core import Extension, setup" \
                     "from setuptools import Extension, setup"
  '';

  build-system = [
    cython
    poetry-core
    setuptools
  ];

  pythonImportsCheck = [ "ulid_transform" ];

  meta = {
    description = "Library to create and transform ULIDs";
    homepage = "https://github.com/bdraco/ulid-transform";
    license = lib.licenses.mit;
  };
}
