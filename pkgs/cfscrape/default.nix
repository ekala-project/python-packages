{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  requests,
}:

buildPythonPackage {
  pname = "cfscrape";
  version = "2.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Anorov";
    repo = "cloudflare-scrape";
    rev = "9692fe7ff3c17b76ddf0f4d50d3dba7d1791c9c6";
    hash = "sha256-uO8lBZonjk+mlFYoNSaz+GIN/W9yf8VL9OQ7MKfsMgI=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  postPatch = ''
    substituteInPlace cfscrape/__init__.py \
      --replace-fail \
        "from urllib3.util.ssl_ import create_urllib3_context, DEFAULT_CIPHERS" \
        "from urllib3.util.ssl_ import create_urllib3_context; DEFAULT_CIPHERS = ':'.join(c['name'] for c in __import__('ssl').SSLContext().get_ciphers())"
  '';

  pythonImportsCheck = [ "cfscrape" ];

  meta = {
    homepage = "https://github.com/Anorov/cloudflare-scrape";
    description = "Python module to bypass Cloudflare's anti-bot page";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
