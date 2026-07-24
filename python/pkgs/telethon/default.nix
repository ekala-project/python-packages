{
  lib,
  buildPythonPackage,
  fetchFromCodeberg,
  openssl,
  rsa,
  pyaes,
  cryptg,
  hatchling,
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "telethon";
  version = "1.44.0";
  pyproject = true;

  src = fetchFromCodeberg {
    owner = "Lonami";
    repo = "Telethon";
    tag = "v${finalAttrs.version}";
    hash = "sha256-NzLlDwxzLWyySluUazQGPDukT71awCrJZEbjd5T9K/g=";
  };

  postPatch = ''
    substituteInPlace telethon/crypto/libssl.py --replace-fail \
      "ctypes.util.find_library('ssl')" "'${lib.getLib openssl}/lib/libssl.so'"
  '';

  build-system = [
    hatchling
  ];

  dependencies = [
    pyaes
    rsa
  ];

  optional-dependencies = {
    cryptg = [ cryptg ];
  };
  meta = {
    homepage = "https://codeberg.org/Lonami/Telethon";
    description = "Full-featured Telegram client library for Python 3";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
