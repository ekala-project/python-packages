{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  asn1crypto,
  cryptography,
  lxml,
  pyhanko-certvalidator,
  pyyaml,
  requests,
  tzlocal,

  # optional-dependencies
  fonttools,
  uharfbuzz,
  pillow,
  python-pkcs11,
  aiohttp,
  signxml,
  qrcode,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyhanko";
  version = "0.35.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "MatthiasValvekens";
    repo = "pyHanko";
    tag = "v${finalAttrs.version}";
    hash = "sha256-CY+YgUu8za5c0t2OKStKvCN9X8hVXT2sN42KSDiyMX8=";
  };

  sourceRoot = "${finalAttrs.src.name}/pkgs/pyhanko";

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "version = \"0.0.0.dev1\"" "version = \"${finalAttrs.version}\""
    substituteInPlace src/pyhanko/version/__init__.py \
      --replace-fail "0.0.0.dev1" "${finalAttrs.version}" \
      --replace-fail "(0, 0, 0, 'dev1')" "tuple(\"${finalAttrs.version}\".split(\".\"))"
  '';

  build-system = [ setuptools ];

  dependencies = [
    asn1crypto
    cryptography
    lxml
    pyhanko-certvalidator
    pyyaml
    requests
    tzlocal
  ];

  optional-dependencies = {
    opentype = [
      fonttools
      uharfbuzz
    ];
    image-support = [ pillow ];
    pkcs11 = [ python-pkcs11 ];
    async-http = [ aiohttp ];
    etsi = [ signxml ];
    qr = [ qrcode ];
  };

  pythonImportsCheck = [ "pyhanko" ];

  meta = {
    description = "Sign and stamp PDF files";
    homepage = "https://github.com/MatthiasValvekens/pyHanko";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
