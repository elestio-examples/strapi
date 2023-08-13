module.exports = ({ env }) => ({
  // ...
  email: {
    config: {
      provider: "nodemailer",
      providerOptions: {
        host: env("SMTP_HOST"),
        port: env("SMTP_PORT"),
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
