{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cmake,
  ninja,
  scikit-build-core,
  ant,
  openjdk,
  packaging,
  pyinstaller,
}:

buildPythonPackage rec {
  pname = "jpype1";
  version = "1.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "originell";
    repo = "jpype";
    tag = "v${version}";
    hash = "sha256-6QKX43XyyBCwOxunQz8lFV1Svh/IXjLtpElbWEx37QQ=";
  };

  build-system = [ scikit-build-core ];

  nativeBuildInputs = [
    cmake
    ninja
    ant
    openjdk
  ];

  dontUseCmakeConfigure = true;

  preBuild = ''
    ant -f native/build.xml jar
  '';

  dependencies = [ packaging ];
  # Cannot find various classes. If you want to fix this
  # take a look at the opensuse packaging:
  # https://build.opensuse.org/projects/openSUSE:Factory/packages/python-JPype1/files/python-JPype1.spec?expand=1
  doCheck = false;
  pythonImportsCheck = [
    "jpype"
    "jpype.imports"
    "jpype.types"
  ];

  meta = {
    homepage = "https://github.com/originell/jpype/";
    sourceProvenance = with lib.sourceTypes; [
      fromSource
      binaryBytecode
    ];
    license = lib.licenses.asl20;
    description = "Python to Java bridge";
  };
}
