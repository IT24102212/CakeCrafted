<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add FAQ</title>
    <link rel="stylesheet" href="../css/style.css" />

    <style>
        body {
            margin: 0;
            padding: 40px;
            font-family: 'Poiret One', cursive;
            background: url('../images/bck1.webp') no-repeat center center fixed;
            background-size: cover;
            color: #e91e63;
        }

        h1 {
            text-align: center;
            font-size: 48px;
            margin-bottom: 30px;
            animation: fadeInDown 1s ease-out;
        }

        form {
            width: 60%;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 1.2s ease;
        }

        label {
            font-size: 18px;
            color: #880e4f;
            display: block;
            margin-bottom: 6px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            margin-bottom: 20px;
            box-sizing: border-box;
        }

        textarea {
            height: 120px;
            resize: vertical;
        }

        button {
            background-color: #e91e63;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #c2185b;
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<jsp:include page="/components/header.jsp" />
    <h1>Create FAQ</h1>
    <form action="${pageContext.request.contextPath}/add-faq" method="post">
        <label for="question">Question:</label>
        <input type="text" id="question" name="question" required />

        <label for="answer">Answer:</label>
        <textarea id="answer" name="answer" required></textarea>

        <button type="submit">Add FAQ</button>
    </form>
</body>
</html>
