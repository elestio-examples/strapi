module.exports = ({ env }) => ({
  // ...
  email: {
    config: {
      provider: "nodemailer",
      providerOptions: {
        host: env("SMTP_HOST", "172.17.0.1"),
        port: env("SMTP_PORT", 25),
        auth: {
          user: "",
          pass: "",
        },
        secure: false,
        // ... any custom nodemailer options
      },
      settings: {
        defaultFrom: env("SMTP_FROM_EMAIL"),
        defaultReplyTo: env("SMTP_FROM_EMAIL"),
      },
    },
  },
  // ...
});
