{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  fonttools,
  runAllTests ? false,
  psautohint, # for passthru.tests
}:

buildPythonPackage (finalAttrs: {
  pname = "psautohint";
  version = "2.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "adobe-type-tools";
    repo = "psautohint";
    tag = "v${finalAttrs.version}";
    sha256 = "125nx7accvbk626qlfar90va1995kp9qfrz6a978q4kv2kk37xai";
    fetchSubmodules = true; # data dir for tests
  };

  postPatch = ''
    echo '#define PSAUTOHINT_VERSION "${finalAttrs.version}"' > libpsautohint/src/version.h
    sed -i '/use_scm_version/,+3d' setup.py
    sed -i '/setup(/a \     version="${finalAttrs.version}",' setup.py
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    fonttools
  ];

  meta = {
    description = "Script to normalize the XML and other data inside of a UFO";
    homepage = "https://github.com/adobe-type-tools/psautohint";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
