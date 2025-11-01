import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import CompletedLine from "./components/CompletedLine.jsx";
import LingeringLine from "./components/LingeringLine.jsx";
import Line from "./components/Line.jsx";
import "./App.css";
function App() {
  const [data0, sethata0] = useState(null);
  const [data1, sethata1] = useState(null);
  const [data2, sethata2] = useState(null);
  const [data3, sethata3] = useState(null);

  function fetchData() {
    fetch("http://127.0.0.1:8000/api/all")
      .then((response) => response.json())
      .then((json) => sethata0(json))
      .catch((error) => console.error("Error fetching data:", error));
  }
  fetch("http://127.0.0.1:8000/api/completed")
    .then((response) => response.json())
    .then((json) => sethata1(json))
    .catch((error) => console.error("Error fetching data:", error));
  fetch("http://127.0.0.1:8000/api/lingering")
    .then((response) => response.json())
    .then((json) => sethata2(json))
    .catch((error) => console.error("Error fetching data:", error));

  function writeLine() {
    if (!data0) {
      return (
        <>
          <p>Loading...</p>
        </>
      );
    }
    return (
      <>
        {data0.map((row) => (
          <Line
            key={row.id}
            id={row.id}
            title={row.title}
            description={row.description}
            is_completed={row.is_completed}
            assigned_to={row.assigned_to}
            created_at={row.created_at}
            updated_at={row.updated_at}
          />
        ))}
      </>
    );
  }

  function writeCompleted() {
    if (!data1) {
      return (
        <>
          <p>Loading...</p>
        </>
      );
    }
    return (
      <>
        {data1.map((row) => (
          <CompletedLine
            key={row.id}
            id={row.id}
            title={row.title}
            description={row.description}
            assigned_to={row.assigned_to}
            created_at={row.created_at}
          />
        ))}
      </>
    );
  }

  function writeLingering() {
    if (!data2) {
      return (
        <>
          <p>Loading...</p>
        </>
      );
    }
    return (
      <>
        {data2.map((row) => (
          <LingeringLine
            key={row.id}
            id={row.id}
            title={row.title}
            description={row.description}
            assigned_to={row.assigned_to}
            created_at={row.created_at}
            task_count={row.task_count}
          />
        ))}
      </>
    );
  }
  return (
    <>
      {fetchData()}
      <h1>To-Do List</h1>
      <main>
        <article>
          <aside>
            <h3>Fennmaradt feladatok</h3>
            <table>
              <tr>
                <th>ID</th>
                <th>Feladat</th>
                <th>Részletek</th>
                <th>Felelős</th>
                <th>Létrehozva</th>
              </tr>
              {writeLingering()}
            </table>
          </aside>
          <aside>
            <h3>Teljesített feladatok</h3>
            <table>
              <tr>
                <th>ID</th>
                <th>Feladat</th>
                <th>Részletek</th>
                <th>Felelős</th>
                <th>Létrehozva</th>
              </tr>
              {writeCompleted()}
            </table>
          </aside>
        </article>
        <article>
          <h3>Összes feladat</h3>
          <table>
            <tr>
              <th>ID</th>
              <th>Feladat</th>
              <th>Részletek</th>
              <th>Állapot</th>
              <th>Felelős</th>
              <th>Létrehozva</th>
              <th>Frissítve</th>
            </tr>
            {writeLine()}
          </table>
        </article>
      </main>
    </>
  );
}

export default App;
