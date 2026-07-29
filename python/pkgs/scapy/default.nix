{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  isPyPy,
  cryptography,
  ipython,
  matplotlib,
  pyx,
  libpcap,
}:

buildPythonPackage rec {
  pname = "scapy";
  version = "2.7.0";
  format = "setuptools";

  disabled = isPyPy;

  src = fetchFromGitHub {
    owner = "secdev";
    repo = "scapy";
    tag = "v${version}";
    hash = "sha256-Pp7pPfaWyzJGf+soENfOPynN8logc5FM848hyVCcdKk=";
  };

  patches = lib.optional (!stdenv.hostPlatform.isStatic) ./find-library.patch;

  postPatch = ''
    printf "${version}" > scapy/VERSION
  ''
  + lib.optionalString (!stdenv.hostPlatform.isStatic) ''
    libpcap_file="${lib.getLib libpcap}/lib/libpcap${stdenv.hostPlatform.extensions.sharedLibrary}"
    if ! [ -e "$libpcap_file" ]; then
        echo "error: $libpcap_file not found" >&2
        exit 1
    fi
    substituteInPlace "scapy/libs/winpcapy.py" \
        --replace "@libpcap_file@" "$libpcap_file"
  '';

  optional-dependencies = {
    all = [
      cryptography
      ipython
      matplotlib
      pyx
    ];
    cli = [ ipython ];
  };

  pythonImportsCheck = [ "scapy" ];

  meta = {
    description = "Python-based network packet manipulation program and library";
    mainProgram = "scapy";
    homepage = "https://scapy.net/";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
