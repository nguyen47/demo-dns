import { exec } from "child_process";

const DOMAIN = "nguyenhoang.ovh";
const SSL_CERTIFICATE_DIR = `/Users/nguyenhoang/dev/script-test/${DOMAIN}`; // /etc/letsencrypt/live/${DOMAIN};
const SETUP_SSL_LOCATION = `/Users/nguyenhoang/dev/script-test/www.${DOMAIN}.conf`; // /etc/nginx/conf.d/www.${DOMAIN}.conf

exec(
  `bash script.sh ${DOMAIN} ${SSL_CERTIFICATE_DIR} ${SETUP_SSL_LOCATION}`,
  (error, stdout, stderr) => {
    if (error) {
      console.error(`error: ${error.message}`);
      return;
    }

    if (stderr) {
      console.error(`stderr: ${stderr}`);
      return;
    }

    console.log(stdout);
  }
);
