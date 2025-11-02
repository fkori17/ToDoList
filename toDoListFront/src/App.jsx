import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import CompletedLine from "./components/CompletedLine.jsx";
import LingeringLine from "./components/LingeringLine.jsx";
import OverloadLine from "./components/OverloadLine.jsx";
import Line from "./components/Line.jsx";
import Layout from "./components/Layout.jsx";
import "./App.css";
function App() {
  const [data_all, setData_All] = useState(null);
  const [data_Completed, sethata_Completed] = useState(null);
  const [data_Lingering, sethata_Lingering] = useState(null);
  const [data_Overload, sethata_Overload] = useState(null);

  function fetchData() {
    fetch("http://127.0.0.1:8000/api/all")
      .then((response) => response.json())
      .then((json) => setData_All(json))
      .catch((error) => console.error("Error fetching data:", error));
    fetch("http://127.0.0.1:8000/api/completed")
      .then((response) => response.json())
      .then((json) => sethata_Completed(json))
      .catch((error) => console.error("Error fetching data:", error));
    fetch("http://127.0.0.1:8000/api/lingering")
      .then((response) => response.json())
      .then((json) => sethata_Lingering(json))
      .catch((error) => console.error("Error fetching data:", error));
    fetch("http://127.0.0.1:8000/api/overload")
      .then((response) => response.json())
      .then((json) => sethata_Overload(json))
      .catch((error) => console.error("Error fetching data:", error));
  }

  function writeLine() {
    if (!data_all) {
      return (
        <tr>
          <td colSpan={7}>Loading...</td>
        </tr>
      );
    }
    return (
      <>
        {data_all.map((row) => (
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
    if (!data_Completed) {
      return (
        <tr>
          <td colSpan={5}>Loading...</td>
        </tr>
      );
    }
    return (
      <>
        {data_Completed.map((row) => (
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
    if (!data_Lingering) {
      return (
        <tr>
          <td colSpan={6}>Loading...</td>
        </tr>
      );
    }
    return (
      <>
        {data_Lingering.map((row) => (
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

  function writeOverload() {
    if (!data_Overload) {
      return (
        <tr>
          <td colSpan={2}>Loading...</td>
        </tr>
      );
    }
    return (
      <>
        {data_Overload.map((row) => (
          <OverloadLine
            key={row.id}
            assigned_to={row.assigned_to}
            task_count={row.task_count}
          />
        ))}
      </>
    );
  }

  return (
    <>
      {fetchData()}
      <Layout>
        <h1>To-Do</h1>
        <h1>List</h1>
      </Layout>
      <main>
        <article>
          <h3>Elhanyagolt feladatok</h3>
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Feladat</th>
                <th>Részletek</th>
                <th>Felelős</th>
                <th>Létrehozva</th>
              </tr>
            </thead>
            <tbody>{writeLingering()}</tbody>
          </table>
        </article>
        <article>
          <h3>Túlterhelt dolgozók</h3>
          <table>
            <thead>
              <tr>
                <th>Felelős</th>
                <th>Feladatok száma</th>
              </tr>
            </thead>
            <tbody>{writeOverload()}</tbody>
          </table>
        </article>
        <article>
          <h3>Teljesített feladatok</h3>
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Feladat</th>
                <th>Részletek</th>
                <th>Felelős</th>
                <th>Létrehozva</th>
              </tr>
            </thead>
            <tbody>{writeCompleted()}</tbody>
          </table>
        </article>
        <article>
          <h3>Összes feladat</h3>
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Feladat</th>
                <th>Részletek</th>
                <th>Állapot</th>
                <th>Felelős</th>
                <th>Létrehozva</th>
                <th>Frissítve</th>
              </tr>
            </thead>
            <tbody>{writeLine()}</tbody>
          </table>
        </article>
      </main>
    </>
  );
}

export default App;
