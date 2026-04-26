$index = Get-Content -Path 'index.html' -Encoding UTF8
$head = $index[0..420]
$header = $index[1085..1676]
$footer = $index[7670..($index.Length - 1)]

function Generate-PolicyPage {
    param (
        [string]$fileName,
        [string]$title,
        [string]$contentPath,
        [string]$middleContent
    )

    $localHead = $head
    for ($i = 0; $i -lt $localHead.Length; $i++) {
        if ($localHead[$i] -like '*<title>*') {
            $localHead[$i] = "  <title>$title | Ace My Assessments</title>"
        }
    }

    $middle = @"
    <!-- Page Title Section -->
    <section class="page-title-section-two" style="padding: 80px 0; background: linear-gradient(135deg, #3F159A, #0E8FCE); color: #fff; text-align: center;">
      <div class="container">
        <h1 style="color:#fff; font-size:42px; font-weight:700;">$title</h1>
        <ul class="page-breadcrumb" style="margin-top:15px; list-style:none; padding:0; display:flex; justify-content:center; gap:10px; color:rgba(255,255,255,0.8);">
          <li><a href="/" style="color:#fff; text-decoration:none;">Home</a></li>
          <li>/</li>
          <li>$title</li>
        </ul>
      </div>
    </section>

    <!-- Content Section -->
    <section style="padding: 80px 0; background-color: #f9f9f9;">
      <div class="container">
        <div class="row">
          <div class="col-lg-10 offset-lg-1">
            <div style="background:#fff; padding:40px; border-radius:15px; box-shadow:0 10px 30px rgba(0,0,0,0.05); font-family: 'Poppins', sans-serif;">
              $middleContent
            </div>
          </div>
        </div>
      </div>
    </section>
"@

    $combined = $localHead + $header + $middle + $footer
    $combined | Set-Content -Path $fileName -Encoding UTF8
}

$termsMiddle = @"
              <h2 style="color:#3F159A; font-weight:700; margin-bottom:30px; border-bottom:2px solid #efefef; padding-bottom:15px;">Terms & Conditions</h2>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Welcome to <strong>Ace My Assessments</strong>. These Terms & Conditions govern your use of our website and services. By placing an order or using our materials, you agree to comply with and be bound by the following terms.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">1. Use of Services</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Ace My Assessments provides academic assistance, including but not limited to, assignment writing, custom essays, research papers, and dissertation help. Our services are intended for research and reference purposes only. We encourage students to use the provided materials as a guide to develop their own original work.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">2. Academic Integrity</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">We do not promote or condone plagiarism or academic dishonesty. The work we provide should be used as a study resource. Directly submitting our work as your own may violate the academic integrity policies of your institution.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">3. Payment Policy</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">All pricing is based on the complexity, deadline, and volume of the order. Payments must be made in full or as per the agreed milestone schedule using our secure payment gateways. Ace My Assessments reserves the right to adjust prices for future services at any time.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">4. Revision Policy</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">We offer unlimited free revisions to ensure the final product meets your initial requirements. Revision requests must be made based on the original instructions. If the request introduces new instructions, additional fees may apply.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">5. Refund and Cancellation</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Refunds are handled on a case-by-case basis. If a client is dissatisfied with the work after multiple revisions, they may request a refund according to our Refund Policy. Cancellations are only permitted before the writer has started working on the assignment.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">6. Intellectual Property</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Once the final payment is cleared and the work is delivered, the client owns the copyright of the specific custom work. However, Ace My Assessments retains the right to use knowledge gained during the research for future projects.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">7. Privacy Policy</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">We are committed to protecting your personal data. We never share your contact information or assignment details with any third party. For more information, please read our Privacy Policy.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">8. Limitation of Liability</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Ace My Assessments is not responsible for any specific grades, academic results, or institutional consequences resulting from the use of our services. The final submission is the sole responsibility of the client.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">9. Contact Us</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">For any queries regarding these terms, please reach out to us:</p>
              <ul style="list-style:square; padding-left:20px; color:#555;">
                <li><strong>Email:</strong> admin@acemyassessments.com</li>
                <li><strong>WhatsApp:</strong> +91 8107057573</li>
                <li><strong>Address:</strong> 3615, Jagannath Shah Ka Rasta, Handipura, Jaipur 302002</li>
              </ul>
"@

$privacyMiddle = @"
              <h2 style="color:#3F159A; font-weight:700; margin-bottom:30px; border-bottom:2px solid #efefef; padding-bottom:15px;">Privacy Policy</h2>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">At <strong>Ace My Assessments</strong>, your privacy is our top priority. This policy explains how we collect, use, and safeguard your data.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">1. Information Collection</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">We collect basic information like your name, email address, and order details to provide our services. We use high-end encryption to ensure that your sensitive data is always secure.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">2. Data Usage</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Your data is used solely for processing orders, communicating updates, and improving our user experience. We never sell or share your data with marketing agencies or third-party institutions.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">3. Confidentiality</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Our writers are bound by strict NDAs. They never know your identity, and your assignment details are purged from our accessible database after a standard retention period following completion.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">4. Cookies</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">We use cookies to remember your preferences and provide a seamless browsing experience. You can choose to disable cookies in your browser settings if you prefer.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">5. Your Rights</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">You have the right to access, correct, or request the deletion of your personal information at any time. Simply contact our support team for assistance.</p>
"@

$refundMiddle = @"
              <h2 style="color:#3F159A; font-weight:700; margin-bottom:30px; border-bottom:2px solid #efefef; padding-bottom:15px;">Refund Policy</h2>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">We strive for 100% customer satisfaction. If you are not happy with our service, our Refund Policy provides clear guidelines on how to request a refund.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">1. Order Cancellation</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">You are eligible for a 100% refund if you cancel your order before an expert has been assigned. If work has already started, a partial refund will be provided based on the progress made.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">2. Quality & Plagiarism</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">If the delivered work does not meet your initial requirements or contains plagiarism, we will provide unlimited free revisions. If a solution cannot be reached after multiple attempts, you may apply for a refund with a valid plagiarism report or instructor feedback.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">3. Missed Deadlines</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">In the rare event that we miss a deadline due to our fault, you are entitled to a refund or credit towards your next order.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">4. Refund Process</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">All refund requests are reviewed by our Quality Assurance team within 7-10 business days. Approved refunds are credited back to the original payment method.</p>
"@

$cancellationMiddle = @"
              <h2 style="color:#3F159A; font-weight:700; margin-bottom:30px; border-bottom:2px solid #efefef; padding-bottom:15px;">Cancellation Policy</h2>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">We understand that plans can change. This policy outlines our procedures for order cancellations.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">1. Immediate Cancellation</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Orders cancelled within 30 minutes of placement are eligible for a full refund, provided work has not started.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">2. Post-Assignment Cancellation</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Once a writer is assigned, cancellation may incur a service fee to compensate the professional for their time and initial research.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">3. Delivery Stage</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Cancellations are not permitted once the final assignment has been uploaded to your dashboard or sent via email.</p>
"@

$guaranteedMiddle = @"
              <h2 style="color:#3F159A; font-weight:700; margin-bottom:30px; border-bottom:2px solid #efefef; padding-bottom:15px;">Guaranteed Policy</h2>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">At Ace My Assessments, we stand by the quality of our work. Our guarantees ensure you receive the best possible service.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">1. 100% Plagiarism-Free</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">We guarantee that every assignment is written from scratch. We use advanced tools to verify the originality of every document before delivery.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">2. On-Time Delivery</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Deadlines are sacred. We guarantee that your assignment will be delivered within the agreed timeframe, or we will provide appropriate compensation.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">3. Expert Quality</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">Your assignments are handles only by subject-matter experts with relevant academic backgrounds and proven writing track records.</p>

              <h4 style="color:#0E8FCE; margin-top:40px; margin-bottom:15px; font-weight:600;">4. 120% Money-Back Guarantee</h4>
              <p style="font-size:16px; color:#555; margin-bottom:20px;">In the unlikely event that we fail to deliver what was promised, we offer a 120% money-back guarantee to ensure your absolute protection.</p>
"@

Generate-PolicyPage "Terms-Conditions.html" "Terms & Conditions" "" $termsMiddle
Generate-PolicyPage "Privacy-Policy.html" "Privacy Policy" "" $privacyMiddle
Generate-PolicyPage "Refund-Policy.html" "Refund Policy" "" $refundMiddle
Generate-PolicyPage "Cancellation-Policy.html" "Cancellation Policy" "" $cancellationMiddle
Generate-PolicyPage "Guaranteed-Policy.html" "Guaranteed Policy" "" $guaranteedMiddle

Write-Host "All policy pages re-generated with corrected head section."
