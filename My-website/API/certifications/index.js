module.exports = async function (context, req) {
  const certifications = [
    {
      code: "AZ-104",
      name: "Azure Administrator Associate",
      issuer: "Microsoft",
      category: "Microsoft",
      level: "Associate",
      badgeUrl: "https://learn.microsoft.com/en-us/media/learn/certification/badges/microsoft-certified-associate-badge.svg",
      verifyUrl: "https://learn.microsoft.com/api/credentials/share/en-gb/SahilMangal-1677/6029C753A3B35F3F?sharingId=3E47EC6402C07A5C",
      description: "Validates skills in managing Azure identities, storage, virtual networks, and compute — implementing, monitoring, and maintaining Azure infrastructure."
    },

    {
      code: "AZ-700",
      name: "Azure Network Engineer Associate",
      issuer: "Microsoft",
      category: "Microsoft",
      level: "Associate",
      badgeUrl: "https://learn.microsoft.com/en-us/media/learn/certification/badges/microsoft-certified-associate-badge.svg",
      verifyUrl: "https://learn.microsoft.com/en-us/users/sahilmangal-1677/credentials/certification/azure-network-engineer-associate?tab=credentials-tab",
      description: "Validates skills in designing, implementing, and maintaining Azure networking — hybrid connectivity, load balancing, network security, and private access."
    },

    {
      code: "MS-900",
      name: "Microsoft 365 Fundamentals",
      issuer: "Microsoft",
      category: "Microsoft",
      level: "Fundamentals",
      badgeUrl: "https://learn.microsoft.com/en-us/media/learn/certification/badges/microsoft-certified-fundamentals-badge.svg",
      verifyUrl: "https://learn.microsoft.com/api/credentials/share/en-gb/SahilMangal-1677/B8F54DE91DC75702?sharingId=3E47EC6402C07A5C",
      description: "Covers Microsoft 365 cloud concepts, core services, security, compliance, and licensing across the M365 productivity suite."
    },
  ];

  context.res = {
    status: 200,
    headers: {
      "Content-Type": "application/json",
      "Cache-Control": "public, max-age=3600"
    },
    body: certifications
  };
};
