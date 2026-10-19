{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pcodedmp";
  version = "1.2.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bontchev";
    repo = "pcodedmp";
    tag = finalAttrs.version;
    hash = "sha256-SYOFGMvrzxDPMACaCvqwU28Mh9LEuvFBGvAph4X+geo=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    # Circular dependency
    substituteInPlace setup.py \
      --replace "'oletools>=0.54'," ""
  '';

  # Module doesn't have tests

  pythonImportsCheck = [ "pcodedmp" ];

  meta = {
    description = "Python VBA p-code disassembler";
    mainProgram = "pcodedmp";
    homepage = "https://github.com/bontchev/pcodedmp";
    license = lib.licenses.gpl3Only;
  };
})
